# Netherlands Telecoms Database

A self-designed MySQL database modelling mobile network operators in the Netherlands — built as a hands-on SQL fundamentals project alongside *Learning SQL* by Alan Beaulieu.

The Dutch telecoms market has three main MNOs (KPN, VodafoneZiggo, and Odido) plus a range of MVNOs. Operators hold spectrum licences, deploy network infrastructure across multiple technology generations (2G, 3G, 4G, 5G), and often belong to larger multinational groups. This structure makes it a good fit for a relational database — there are clear entities, relationships, and hierarchies to model.

## Database

MySQL 9.7, connected via DBeaver.

## Domain

Key entities in the telecoms industry that this database will model:

| Entity | Description |
|---|---|
| Operator | A licensed MNO operating in a specific country (e.g. Vodafone UK) |
| Group | The parent company that owns one or more operators (e.g. Vodafone Group) |
| Country | The market in which an operator holds a licence |
| Network | A specific technology generation deployed by an operator (2G/3G/4G/5G) |
| Subscriber | The customer base of an operator, tracked over time |

## Project scope

This project is being built incrementally alongside *Learning SQL*. Each phase adds to the schema as new SQL concepts are introduced in the book.

| Phase | Book chapter | What gets added |
|---|---|---|
| 1 — Foundations | Chapter 2 | `operator` and `network` tables, basic INSERT and SELECT |
| 2 — Relationships | Chapter 5 (JOINs) | `group` and `country` tables, foreign keys |
| 3 — Analysis | Chapter 8+ | Subscriber data, aggregations, reporting queries |

## Current status

Phase 1 in progress — `operator` and `network` tables created and populated.

**Operators:** KPN, VodafoneZiggo, Odido (MNOs), Simyo, Ben (MVNOs)

**Networks:** 4G and 5G records for all three MNOs

## Schema

### `operator`

| Column | Type | Notes |
|---|---|---|
| `operator_id` | SMALLINT UNSIGNED | Primary key, auto-increment |
| `company_name` | VARCHAR(100) | |
| `parent_company` | VARCHAR(100) | |
| `company_type` | ENUM | MNO, MVNO, ISP, MVNE, MVNA, ICTSP |
| `ownership` | ENUM | Public, Private, State-owned, Joint venture |
| `headquarters` | VARCHAR(100) | |
| `website` | VARCHAR(255) | |
| `employees` | INTEGER | |
| `annual_revenue` | DECIMAL(15,2) | In euros |
| `last_updated` | DATETIME | |
| `source` | VARCHAR(255) | |

### `network`

| Column | Type | Notes |
|---|---|---|
| `operator_id` | SMALLINT UNSIGNED | Primary key (composite); foreign key to `operator` |
| `technology` | ENUM | Primary key (composite); 2G, 3G, 4G, 5G |
| `launch_year` | YEAR | |
| `network_vendor` | VARCHAR(100) | e.g. Ericsson, Nokia, Huawei |
| `coverage_percentage` | DECIMAL(5,2) | |
