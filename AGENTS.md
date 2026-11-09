# Working in this repository

This is a design-stage VB.NET to C# .NET 8 migration skill kit. Preserve the explicit distinction between implemented helpers, planned components, and demonstrated migration results.

- Read docs/VALIDATION-STATUS.md before changing support claims.
- Keep target application TFM independent of the runtime that executes a converter.
- Put deterministic extraction and validation in scripts; put decision guidance in focused skills.
- Each skill must install independently with its own references. Use top-level name and description in SKILL.md and keep the directory name equal to name.
- Prefer source-backed findings. Record unresolved references, dynamic behavior and unexecuted checks.
- Build success does not prove parity. Never add fake implementation, remove tests, or turn not-run into pass.
- Keep original generated-file provenance, resources, public contracts and observable VB behavior until an explicit plan changes them.
- Do not publish application source/data or deploy systems as an implied part of migration.
- Run pwsh -NoProfile -File ./scripts/Test-Kit.ps1 for edits to skill metadata, contracts and examples. This checks structure only.
- Update docs/VALIDATION-STATUS.md with exactly what ran. A static fixture check is not an application migration test.
