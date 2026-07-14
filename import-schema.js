const fs = require('fs');
const path = require('path');
const mysql = require('mysql2/promise');

async function run() {
  const config = JSON.parse(fs.readFileSync(path.join(__dirname, 'config.json'), 'utf8'));
  const conn = await mysql.createConnection(config.mysql);

  const sql = fs.readFileSync(path.join(__dirname, 'schema.sql'), 'utf8');

  const queries = sql.split(';');
  for (const q of queries) {
    if (q.trim()) {
      await conn.query(q);
    }
  }

  const [rows] = await conn.query('SHOW TABLES');
  console.log('Tables:', rows);

  await conn.end();
  process.exit(0);
}

run().catch((err) => {
  console.error(err);
  process.exit(1);
});
