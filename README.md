# ETL Center of Hope

Exports clinical data from SQL Server (`HIV_Treatment`) into MySQL (`preart`) for Center of Hope.

## Setup

1. Install [Node.js](https://nodejs.org/) 18+
2. Install **ODBC Driver 17 for SQL Server**
3. Copy config:
   ```bash
   copy config.example.json config.json
   ```
4. Edit `config.json` (SQL Server + MySQL connection)
5. Install dependencies:
   ```bash
   npm install
   ```
6. Create MySQL schema (optional helper):
   ```bash
   node import-schema.js
   ```

## Run

- Dashboard UI:
  ```bash
  npm start
  ```
  Open http://localhost:3000 — use **Extract Data** to run the ETL.

- CLI / scheduled ETL:
  ```bash
  node scheduled-task/scheduled-etl.js
  ```

- Build standalone exe:
  ```bash
  npm run build:etl
  ```
  Places `etl-tool.exe` next to `config.json`.

## Source tables (SQL Server)

`tblPATIENT`, `tblPATIENTINFO`, `tblBAS`, `tblDIS`, `tblVIS`, `tblCLM`, `tblART`, `tblLAB`, `tblLAB_CD4`, `tblLAB_RNA`
