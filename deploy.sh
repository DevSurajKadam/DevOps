#!/usr/bin/env bash
set -euo pipefail

BUCKET="suraj-learn-s3-bucket"
PROFILE="default"
REGION="eu-north-1"
SOURCE_DIR="${1:-.}"           # pass folder as first arg, defaults to current dir
LOGFILE="${2:-deploy.log}"     # optional second arg for logfile
DRY_RUN="${DRY_RUN:-false}"

# ---------- CONFIG ----------
BUCKET="suraj-learn-s3-bucket"


# ---------- PRECHECKS ----------
echo "Deploy: source=${SOURCE_DIR} -> s3://${BUCKET} (profile=${PROFILE}, region=${REGION})"
if [ "$DRY_RUN" = "true" ]; then
  echo "DRY RUN enabled: no changes will be made"
fi

# Ensure aws cli is available
if ! command -v aws >/dev/null 2>&1; then
  echo "ERROR: aws CLI not found. Install and configure AWS CLI first." >&2
  exit 2
fi

# Show a dry-run first (recommended)
if [ "$DRY_RUN" = "true" ]; then
  aws s3 sync "$SOURCE_DIR" "s3://${BUCKET}" --profile "$PROFILE" --region "$REGION" --delete --dryrun | tee "$LOGFILE"
  echo "Dry run complete. Inspect $LOGFILE and remove DRY_RUN or set to false to run actual deploy."
  exit 0
fi

# ---------- SYNC ----------
# Perform sync. --delete removes objects in S3 that are not present in source.
aws s3 sync "$SOURCE_DIR" "s3://${BUCKET}" \
  --profile "$PROFILE" \
  --region "$REGION" \
  --delete \
  --acl bucket-owner-full-control \
  | tee "$LOGFILE"

echo "Sync complete. Logs: $LOGFILE"


echo "Deploy finished successfully."

