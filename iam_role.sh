#!/bin/bash
#
# iam_bindings.sh
# This script grants the Editor role to specific service accounts/users
# for the SecureScalerGCP project.

PROJECT_ID="SecureScalerGCP"

echo "Setting IAM bindings for project: $PROJECT_ID..."

# 1. Grant Editor to the Compute Engine default service account
gcloud projects add-iam-policy-binding "$PROJECT_ID" \
    --member="serviceAccount:256442435881-compute@developer.gserviceaccount.com" \
    --role="roles/editor"

# 2. Grant Editor to user: Soumyo Subhra Nandy (m23aid013@iitj.ac.in)
gcloud projects add-iam-policy-binding "$PROJECT_ID" \
    --member="user:m23aid013@iitj.ac.in" \
    --role="roles/owner"

# 3. Grant Editor to user: som10.qea2@gmail.com
gcloud projects add-iam-policy-binding "$PROJECT_ID" \
    --member="user:som10.qea2@gmail.com" \
    --role="roles/editor"
