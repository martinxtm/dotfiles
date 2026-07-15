---
name: dbt-data-catalog
description: generate and maintain a machine-readable data map for a dbt project. use when chatgpt needs to inspect a dbt repo, read manifest or catalog metadata, identify canonical models, document dimensions or facts, trace lineage, define trusted metrics, or produce analyst-facing model guidance for snowflake tables and dbt models.
---

# Purpose
Generate and maintain a machine-readable "Data Map" for this dbt project so an analysis agent can pick correct Snowflake tables/models.

# Output (definition of done)
Create/refresh docs/mm_dbt_data_map.md and docs/mm_dbt_data_map.yml with:
- Overview: domains, environments, naming conventions
- Model inventory (all models): name, schema, materialization, tags, description, owners
- Certified entities:
  - Dimensions: grain, primary key, canonical time fields, join contracts, pitfalls
  - Facts: grain, primary key/composite key, canonical time fields, join contracts, pitfalls
- Dependency summary: upstream refs for each certified model
- Metric definitions section: canonical metrics with exact SQL logic and required filters
- “Golden paths” for common questions: starting model(s), joins, filters, sanity checks
- Trust rules: which layers to prefer, how to choose canonical models, test-based confidence

# How to extract dbt metadata
Prefer generated artifacts in target/:
- target/manifest.json (dependency graph, configs, columns, tags)
- target/catalog.json (types)
If missing, run:
- dbt deps
- dbt docs generate

# Constraints
- Do not invent grains, join keys, or metric logic. If not documented in schema.yml or model SQL, mark as TODO with file/line references.
- Prefer models with tests (unique/not_null/relationships) and descriptions.
- Keep entries consistent with a strict schema.
- In analyst-facing docs, normalize away target-specific dev schemas such as `dbt_mocker*`. Prefer logical schemas derived from dbt config, e.g. `PUBLIC`, `METRICS`, `JOB_RECOMMENDER`, `JUICER`.
- Do not document `data_platform.jobs_postings` lineage as `MYSQL_DATA.PUBLIC.JOBS_POSTINGS`. In this repo's data map, interpret that lineage as `MYSQL_DATA.PUBLIC.POSTINGS`.
- When documenting thin derived models such as `top_paid_postings`, make it explicit when they are dbt views over another model rather than standalone physical source tables.

# Commands (if needed)
- dbt --version
- dbt docs generate
- ls -la target
