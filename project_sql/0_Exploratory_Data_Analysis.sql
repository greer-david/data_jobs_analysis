--Working with Dates

--Cast a timestamp as a Date datatype

SELECT
    job_title_short,
    job_location,
    job_posted_date::DATE
FROM
    job_postings_fact
;

-- Converting time zones.  This is also how to convert a time zone that wasn't stored with a time zone.

SELECT
    job_title_short,
    job_location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' date_time
FROM
    job_postings_fact
;

-- Extracting the month and year from the job posting date.

SELECT
    job_title_short,
    job_location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' date_time,
    EXTRACT (MONTH FROM job_posted_date) date_month,
    EXTRACT (YEAR FROM job_posted_date) date_year
FROM
    job_postings_fact
;

-- High-level trend analysis of job postings by month.

SELECT
    COUNT(job_id) job_count,
    EXTRACT (MONTH FROM job_posted_date) date_month
FROM
    job_postings_fact
GROUP BY
    date_month
ORDER BY
    job_count DESC
;

/*

Find the count of the number of remote Data Analyst and Business Analyst job postings per skill.
    - Display the top 10 skills by their demand in remote jobs.
    - Include skill ID, name, and count of postings requiring the skill.

*/

SELECT
    skills,
    COUNT(*) job_post_count
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
    job_work_from_home = TRUE
AND
    job_title_short IN ('Data Analyst','Business Analyst')
GROUP BY
    skills
ORDER BY
    job_post_count DESC
LIMIT 10
;

-- Checking for duplicates in the skills_dim table.

SELECT
    COUNT(*)
FROM
    skills_dim
;

SELECT
    COUNT(DISTINCT skills)
FROM
    skills_dim
;

SELECT
    skills,
    COUNT(*) skill_cnt
FROM
    skills_dim
GROUP BY
    skills
HAVING
    COUNT(*) > 1
ORDER BY
    skills
;

--Removing the duplicates with window functions.


SELECT *
FROM (
    SELECT
        skill_id,
        ROW_NUMBER() OVER(PARTITION BY skills ORDER BY skill_id) rn
    FROM
        skills_dim
) row_num
WHERE
    rn > 1
;

DELETE FROM
    skills_dim
WHERE
    skill_id IN (
        SELECT skill_id
        FROM (
            SELECT
                skill_id,
                ROW_NUMBER() OVER(PARTITION BY skills ORDER BY skill_id) rn
            FROM
                skills_dim
        ) row_num
        WHERE
            rn > 1
    )
;

SELECT
    COUNT(*) c_count,
    name
FROM
    company_dim
GROUP BY
    name
ORDER BY
    c_count DESC
;

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

-- Query for Skill demand histogram

SELECT
    skills,
    job_id
FROM
    skills_job_dim sj
JOIN
    skills_dim s
ON
    sj.skill_id = s.skill_id
GROUP BY
    skills
ORDER BY
    skill_cnt DESC
;

