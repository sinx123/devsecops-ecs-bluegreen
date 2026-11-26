# Screenshot checklist

Capture these **after a real deployment**, save them in this folder with the exact file names below,
and the README will display them automatically.

| File name | Where to capture | What it proves |
|---|---|---|
| `01-pipeline-all-gates-green.png` | Actions tab, a successful run showing the job graph | Pipeline: every security gate passes before deploy |
| `02-gitleaks-blocked-secret.png` | Use a PR with a FAKE key; screenshot the failed job | Gitleaks blocks a committed credential |
| `03-trivy-blocked-vulnerability.png` | Temporarily pin an old library; screenshot the failed step | Trivy fails the build on a critical/high CVE |
| `04-codedeploy-canary.png` | AWS Console > CodeDeploy > Deployments > your deployment | CodeDeploy blue/green canary: 10% traffic shift |
| `05-codedeploy-auto-rollback.png` | Break `/health`, deploy, screenshot the stopped/rolled-back deployment | Automatic rollback after the 5xx alarm fires |
| `06-sbom-in-s3.png` | S3 console showing `sbom.spdx.json` (hide the account ID) | SBOM stored per commit in S3 |
| `07-cosign-verify.png` | Terminal output of the `cosign verify ...` command | Cosign signature verification succeeds |

## Rules
1. **Redact sensitive data:** AWS account IDs, ARNs, email addresses, Slack webhook URLs, public IPs/DNS names you do not want shared. Blur or crop them.
2. **Format:** PNG, under ~1 MB each, around 1400 px wide. Crop out unrelated browser tabs and bookmarks.
3. **Show success AND failure:** a blocked bad commit or a rollback is more impressive than a plain green check.
4. **Verify before pushing:** run `bash docs/check_screenshots.sh` (reports any image the README references but is missing).
5. **Optional:** record a 2-3 minute demo (Loom or a screen recorder), upload it, and add the link under the README title.
