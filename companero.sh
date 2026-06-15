#!/bin/bash

# ============================================================
# BlackHatBash Branch Grader
# Evaluates:
# - Commit distribution
# - Commits during class hours
# - Comment coverage
# - English comments
# - Comment quality
# ============================================================

REPO_URL="$1"
BRANCH="${2:-blackhatbash}"

TEMP_DIR=$(mktemp -d)

git clone "$REPO_URL" "$TEMP_DIR" >/dev/null 2>&1 || {
    echo "Failed to clone repository."
    exit 1
}
echo
echo "Available branches:"
git branch -a
echo

cd "$TEMP_DIR" || exit 1

if git show-ref --verify --quiet "refs/remotes/origin/${BRANCH}"; then
    git checkout -b "${BRANCH}" "origin/${BRANCH}" >/dev/null 2>&1
elif git show-ref --verify --quiet "refs/heads/${BRANCH}"; then
    git checkout "${BRANCH}" >/dev/null 2>&1
else
    echo "Branch '${BRANCH}' not found."
    echo
    echo "Available branches:"
    git branch -a
    exit 1
fi

echo "BLACKHATBASH QUALITY REPORT"
echo "==========================="
echo

# ------------------------------------------------------------
# Commit Analysis
# ------------------------------------------------------------

TOTAL_COMMITS=$(git rev-list --count "${BRANCH}")

if (( TOTAL_COMMITS == 1 )); then
    DISTRIBUTION_SCORE=5
elif (( TOTAL_COMMITS == 2 )); then
    DISTRIBUTION_SCORE=15
elif (( TOTAL_COMMITS == 3 )); then
    DISTRIBUTION_SCORE=25
elif (( TOTAL_COMMITS == 4 )); then
    DISTRIBUTION_SCORE=32
else
    DISTRIBUTION_SCORE=40
fi

CLASS_COMMITS=0

while read -r HASH; do

    DAY=$(git show -s --format=%cd --date=format:'%u' "$HASH")

    UTC_HOUR=$(git show -s --format=%cd --date=format:'%H' "$HASH")

    LOCAL_HOUR=$((10#$UTC_HOUR - 5))

    if (( LOCAL_HOUR < 0 )); then
        LOCAL_HOUR=$((LOCAL_HOUR + 24))
    fi

    if [[ "$DAY" == "1" || "$DAY" == "3" ]]; then
    if (( LOCAL_HOUR >= 7 && LOCAL_HOUR < 9 )); then
        ((CLASS_COMMITS++))
    fi
fi

done < <(git rev-list "${BRANCH}")

if (( TOTAL_COMMITS > 0 )); then
    PERCENT=$(( CLASS_COMMITS * 100 / TOTAL_COMMITS ))
else
    PERCENT=0
fi

if (( PERCENT >= 90 )); then
    CLASS_SCORE=35
elif (( PERCENT >= 80 )); then
    CLASS_SCORE=30
elif (( PERCENT >= 70 )); then
    CLASS_SCORE=25
elif (( PERCENT >= 60 )); then
    CLASS_SCORE=20
elif (( PERCENT >= 50 )); then
    CLASS_SCORE=15
elif (( PERCENT >= 40 )); then
    CLASS_SCORE=10
else
    CLASS_SCORE=5
fi
# ------------------------------------------------------------
# Checkout branch silently
# ------------------------------------------------------------

CURRENT_BRANCH=$(git branch --show-current)

git checkout "${BRANCH}" >/dev/null 2>&1

# ------------------------------------------------------------
# Script Analysis
# ------------------------------------------------------------

TOTAL_COMMENT_LINES=0
TOTAL_CODE_LINES=0

ENGLISH_COMMENTS=0
SPANISH_COMMENTS=0

GOOD_COMMENTS=0
ALL_COMMENTS=0

while IFS= read -r FILE; do

    while IFS= read -r LINE; do

        if [[ "$LINE" =~ ^[[:space:]]*# ]]; then

            ((TOTAL_COMMENT_LINES++))
            ((ALL_COMMENTS++))

            COMMENT=$(echo "$LINE" | sed 's/^[[:space:]]*#//')

            WORD_COUNT=$(echo "$COMMENT" | wc -w)

            if (( WORD_COUNT >= 4 )); then
                ((GOOD_COMMENTS++))
            fi

            if echo "$COMMENT" | grep -Eiq \
                'archivo|salida|espera|esperar|bucle|crear|ejecutar|comprobar|contenido|mientras|si|entonces|fin'; then
                ((SPANISH_COMMENTS++))
            else
                ((ENGLISH_COMMENTS++))
            fi

        elif [[ -n "${LINE// }" ]]; then
            ((TOTAL_CODE_LINES++))
        fi

    done < "$FILE"

done < <(find . -type f -name "*.sh")

# ------------------------------------------------------------
# Comment Coverage Score (10 pts)
# ------------------------------------------------------------

if (( TOTAL_CODE_LINES == 0 )); then
    COVERAGE_SCORE=0
else
    COVERAGE_PERCENT=$(( TOTAL_COMMENT_LINES * 100 / TOTAL_CODE_LINES ))

    if (( COVERAGE_PERCENT >= 20 )); then
        COVERAGE_SCORE=10
    elif (( COVERAGE_PERCENT >= 10 )); then
        COVERAGE_SCORE=7
    elif (( COVERAGE_PERCENT >= 5 )); then
        COVERAGE_SCORE=4
    else
        COVERAGE_SCORE=1
    fi
fi

# ------------------------------------------------------------
# English Comments Score (10 pts)
# ------------------------------------------------------------

TOTAL_LANGUAGE=$(( ENGLISH_COMMENTS + SPANISH_COMMENTS ))

if (( TOTAL_LANGUAGE == 0 )); then
    ENGLISH_SCORE=0
else
    ENGLISH_SCORE=$(( ENGLISH_COMMENTS * 10 / TOTAL_LANGUAGE ))
fi

# ------------------------------------------------------------
# Comment Quality Score (5 pts)
# ------------------------------------------------------------

if (( ALL_COMMENTS == 0 )); then
    QUALITY_SCORE=0
else
    QUALITY_SCORE=$(( GOOD_COMMENTS * 5 / ALL_COMMENTS ))
fi

# ------------------------------------------------------------
# Final Score
# ------------------------------------------------------------

FINAL_SCORE=$(( \
    DISTRIBUTION_SCORE + \
    CLASS_SCORE + \
    COVERAGE_SCORE + \
    ENGLISH_SCORE + \
    QUALITY_SCORE ))

if (( FINAL_SCORE > 100 )); then
    FINAL_SCORE=100
fi

# ------------------------------------------------------------
# Restore original branch
# ------------------------------------------------------------

git checkout "${CURRENT_BRANCH}" >/dev/null 2>&1

# ------------------------------------------------------------
# Report
# ------------------------------------------------------------

echo "Commits in branch : ${TOTAL_COMMITS}"
echo "Commits in class  : ${CLASS_COMMITS}"
echo

echo "Commit Distribution : ${DISTRIBUTION_SCORE}/40"
echo "Class Schedule      : ${CLASS_SCORE}/35"
echo "Comment Coverage    : ${COVERAGE_SCORE}/10"
echo "English Comments    : ${ENGLISH_SCORE}/10"
echo "Comment Quality     : ${QUALITY_SCORE}/5"
echo

echo "FINAL SCORE         : ${FINAL_SCORE}/100"

if (( FINAL_SCORE >= 90 )); then
    GRADE="A"
elif (( FINAL_SCORE >= 80 )); then
    GRADE="B"
elif (( FINAL_SCORE >= 70 )); then
    GRADE="C"
elif (( FINAL_SCORE >= 60 )); then
    GRADE="D"
else
    GRADE="F"
fi

echo "GRADE               : ${GRADE}"

echo
echo "CLASS SCHEDULE ANALYSIS"
echo "-----------------------"
echo "Total commits      : ${TOTAL_COMMITS}"
echo "Commits in class   : ${CLASS_COMMITS}"
echo "Outside class      : $((TOTAL_COMMITS - CLASS_COMMITS))"
echo "Percentage         : ${PERCENT}%"
echo "Schedule score     : ${CLASS_SCORE}/35"
echo