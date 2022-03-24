/* eslint-disable no-console */
import { PrismaClient } from '@prisma/client';
import chalk from 'chalk';


export const prisma = new PrismaClient({
	log: [{
		level: 'query',
		emit: 'event',
	}],
});

const maxTableNameLength = Object.keys(prisma).filter(key => !(key.startsWith('$') || key.startsWith('_'))).reduce((maxLength, str) => {
	if (str.length > maxLength) {
		return str.length;
	}

	return maxLength;
}, 0);

const colors = {
	SELECT: chalk.hex('#4287f5'),
	INSERT: chalk.hex('#54f542'),
	UPDATE: chalk.hex('#9942f5'),
	DELETE: chalk.hex('#C94B32'),
	default: chalk.reset,
};

const logAboveMs = -1;
const tableNameRegExp = /(?:FROM|INTO)\s.*?\.(`?)?(?:\S*?([a-z_A-Z]+))\1/;
prisma.$on('query', e => {
	if (e.duration <= logAboveMs) {
		return;
	}

	switch (e.query) {
		case 'BEGIN':
		case 'COMMIT':
		case 'SELECT 1':
			return;
	}

	const tableName = tableNameRegExp.exec(e.query)?.[2] ?? 'Unknown table';

	if (tableName == 'Unknown table') {
		console.log(e.query);
	}

	const operation = e.query.split(' ')[0];
	const color = colors[operation] ?? colors.default;

	console.log(`[${new Date(e.timestamp).toLocaleString()}] @ ${color(operation)} table "${tableName}" ${'.'.repeat(maxTableNameLength + 3 - tableName.length)} ${e.duration}ms`);

	console.log(e.query);
});
