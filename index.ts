// eslint-disable-next-line @typescript-eslint/no-var-requires
import 'dotenv/config';
import { prisma } from './prisma';


async function main() {
	const undoIdsToDelete = (await prisma.undozak.findMany({
		select: {
			idUndo: true,
		},
		take: 15,
	})).map(row => row.idUndo);

	const results: string[] = [];
	let toProcess: number;
	while (toProcess = undoIdsToDelete.pop()!) {
		try {
			const needle = { where: { idUndo: toProcess } } as const;

			const before = new Date().getTime();
			await prisma.$transaction([
				prisma.undozakp.deleteMany(needle),
				prisma.undozaknos.deleteMany(needle),
				prisma.undonosskup.deleteMany(needle),
				prisma.undozakobdobi.deleteMany(needle),
				prisma.undozak.deleteMany(needle),
			]);

			const message = `Processed idUndo "${toProcess}" in ${new Date().getTime() - before}ms`;
			results.push(message);
		} catch (error) {
			const message = `Deleting of undo where "idUndo = ${toProcess}" have failed!`;
			results.push(message);
			console.error(message, error);
		}
	}

	results.forEach(message => console.log(message));
}

main();
