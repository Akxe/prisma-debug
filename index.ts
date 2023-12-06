import { prisma } from './prisma';


async function main() {
	await prisma.$connect();
	const r2 = await prisma.offer.findMany({
		select: {
			offerID: true,
			title: true,
			parentChildReason: true,
			currency: true,
			corporationType: true,
		},
	});
	console.log(`Returned ${r2.length} results`);
}

main();
