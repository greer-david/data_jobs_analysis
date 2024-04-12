/*

Question: Which skill types should prospective data & business analysts focus on?
- Compare the skill share of top skills from all jobs to data & business analyst jobs.
- Why? Give prospective data & business analysts an idea on how their roles differ
from other jobs in the data field and what skill types to focus on.

*/

-- Count of Job postings by skill type

SELECT
    COUNT(*) post_count,
    type
FROM
    job_postings_fact jp
JOIN
    skills_job_dim sj
ON
    jp.job_id = sj.job_id
JOIN
    skills_dim s
ON
    sj.skill_id = s.skill_id
GROUP BY
    type
ORDER BY
    post_count DESC
;

-- Count of Job postings by skill type for Data and Business Analysts

SELECT
    COUNT(*) post_count,
    type
FROM
    job_postings_fact jp
JOIN
    skills_job_dim sj
ON
    jp.job_id = sj.job_id
JOIN
    skills_dim s
ON
    sj.skill_id = s.skill_id
WHERE
    job_title_short IN ('Data Analyst', 'Business Analyst')
GROUP BY
    type
ORDER BY
    post_count DESC
;

--Skill Count and Skill Share for data & business analysts

SELECT
    skill_count,
    type,
    ROUND(skill_count / job_cnt * 100,2)AS skill_share
FROM (
    SELECT
        COUNT(*)::NUMERIC skill_count,
        type,
        (
        SELECT
            COUNT(sj.job_id)::NUMERIC
        FROM
            skills_job_dim sj
        JOIN
            job_postings_fact jp
        ON
            sj.job_id = jp.job_id
        WHERE
            job_title_short IN ('Data Analyst', 'Business Analyst')
        ) job_cnt
    FROM
        job_postings_fact jp
    JOIN
        skills_job_dim sj
    ON
        jp.job_id = sj.job_id
    JOIN
        skills_dim s
    ON
        sj.skill_id = s.skill_id
    WHERE
        job_title_short IN ('Data Analyst', 'Business Analyst')
    GROUP BY
        type
    ) types
ORDER BY
    skill_count DESC
;

--Skill Count and Skill Share for all jobs

SELECT
    skill_count,
    type,
    ROUND(skill_count / job_cnt * 100,2)AS skill_share
FROM (
    SELECT
        COUNT(*)::NUMERIC skill_count,
        type,
        (
        SELECT
            COUNT(job_id)::NUMERIC
        FROM
            skills_job_dim
        ) job_cnt
    FROM
        job_postings_fact jp
    JOIN
        skills_job_dim sj
    ON
        jp.job_id = sj.job_id
    JOIN
        skills_dim s
    ON
        sj.skill_id = s.skill_id
    GROUP BY
        type
    ) types
ORDER BY
    skill_count DESC
;

/*
Skill-share comparison queries INSIGHTS:

- Analyst Tools and Programming: For data & business analysts, the most
prevalent skill types are analyst tools (41.56%) and programming (37.34%).
This indicates the importance of proficiency in tools for data analysis
and visualization, as well as programming languages for data manipulation
and scripting.

- Cloud and Libraries: Cloud-related skills have a higher skill share in
all data jobs (15.05%) compared to data & business analysts (7.84%).
Similarly, libraries have a higher skill share in all data jobs (14.20%)
compared to the specific subset of data & business analysts (4.16%). This
suggests that while cloud and library skills are important across all
data roles, they may be relatively less emphasized in data & business
analyst roles.

Skill-share comparison queries RESULTS:

- All Jobs Results:
[
  {
    "skill_count": "1398696",
    "type": "programming",
    "skill_share": "38.12"
  },
  {
    "skill_count": "632696",
    "type": "analyst_tools",
    "skill_share": "17.24"
  },
  {
    "skill_count": "552271",
    "type": "cloud",
    "skill_share": "15.05"
  },
  {
    "skill_count": "521217",
    "type": "libraries",
    "skill_share": "14.20"
  },
  {
    "skill_count": "260389",
    "type": "other",
    "skill_share": "7.10"
  },
  {
    "skill_count": "152168",
    "type": "databases",
    "skill_share": "4.15"
  },
  {
    "skill_count": "60279",
    "type": "os",
    "skill_share": "1.64"
  },
  {
    "skill_count": "44241",
    "type": "webframeworks",
    "skill_share": "1.21"
  },
  {
    "skill_count": "39697",
    "type": "async",
    "skill_share": "1.08"
  },
  {
    "skill_count": "7950",
    "type": "sync",
    "skill_share": "0.22"
  }
]

Data & Business Analysts Results:
[
  {
    "skill_count": "320186",
    "type": "analyst_tools",
    "skill_share": "41.56"
  },
  {
    "skill_count": "287662",
    "type": "programming",
    "skill_share": "37.34"
  },
  {
    "skill_count": "60407",
    "type": "cloud",
    "skill_share": "7.84"
  },
  {
    "skill_count": "32011",
    "type": "libraries",
    "skill_share": "4.16"
  },
  {
    "skill_count": "22575",
    "type": "other",
    "skill_share": "2.93"
  },
  {
    "skill_count": "20794",
    "type": "databases",
    "skill_share": "2.70"
  },
  {
    "skill_count": "11337",
    "type": "async",
    "skill_share": "1.47"
  },
  {
    "skill_count": "6872",
    "type": "os",
    "skill_share": "0.89"
  },
  {
    "skill_count": "6301",
    "type": "webframeworks",
    "skill_share": "0.82"
  },
  {
    "skill_count": "2238",
    "type": "sync",
    "skill_share": "0.29"
  }
]
*/