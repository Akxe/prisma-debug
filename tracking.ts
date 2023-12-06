import { OTLPTraceExporter } from '@opentelemetry/exporter-trace-otlp-http';
import { registerInstrumentations } from '@opentelemetry/instrumentation';
import { Resource } from '@opentelemetry/resources';
import { SimpleSpanProcessor } from '@opentelemetry/sdk-trace-base';
import { NodeTracerProvider } from '@opentelemetry/sdk-trace-node'
import { SemanticResourceAttributes } from '@opentelemetry/semantic-conventions';
import { PrismaInstrumentation } from '@prisma/instrumentation';


// Configure the trace provider
const provider = new NodeTracerProvider({
	resource: new Resource({
		[SemanticResourceAttributes.SERVICE_NAME]: 'Prisma-debug by Akxe',
	}),
});

// exporter that natively works with jaeger without extras
const otlpTraceExporter = new OTLPTraceExporter();
provider.addSpanProcessor(new SimpleSpanProcessor(otlpTraceExporter));

export const tracer = provider.getTracer('Application');
let registered = false;
export function register() {
	if (registered) {
		return;
	}

	// Register your auto-instrumentary
	registerInstrumentations({
		instrumentations: [
			new PrismaInstrumentation({ middleware: true }),
		],
	});

	// Register the provider globally
	provider.register();
	registered = true;

	console.log('\n');
	console.log('Tracer set up at: http://localhost:16686/');
	console.log('    Do not forget to run ".\\jaeger-all-in-one.exe --collector.zipkin.host-port=:9411 --collector.otlp.enabled"');
	console.log('');

	process.on('SIGTERM', () => {
		Promise.all([
			provider.shutdown().catch(console.error),
		]).finally(() => {
			process.exit(0);
		});
	});
}
