import { prisma } from './prisma';


async function main() {
	await prisma.$connect();
	const r2 = await prisma.company.findMany({
		select: {
			companyID: true,
			typDPH: true
		},
	});
	console.log(`Returned ${r2.length} results`);
}

main();
