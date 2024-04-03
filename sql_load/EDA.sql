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
    - Display the top 5 skills by their demand in remote jobs.
    - Include skill ID, name, and count of postings requiring the skill.

*/
WITH remote_d_b_jobs AS (
    SELECT
        skill_id,
        COUNT(*) job_count
    FROM
        skills_job_dim sj
    JOIN
        job_postings_fact jp
    ON
        sj.job_id = jp.job_id
    WHERE
        job_work_from_home = TRUE
    AND
        (job_title_short = 'Data Analyst' OR job_title_short = 'Business Analyst')
    GROUP BY
        skill_id
)
SELECT
    s.skill_id,
    skills skill_name,
    job_count
FROM
    skills_dim s
JOIN
    remote_d_b_jobs r
ON
    s.skill_id = r.skill_id
ORDER BY
    job_count DESC
LIMIT 5
;