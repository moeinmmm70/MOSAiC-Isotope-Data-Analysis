-- Q1: Sample inventory by media type and leg
SELECT
    media_type,
    leg,
    COUNT(*) AS n_samples
FROM ciasom_samples
GROUP BY
    media_type,
    leg
ORDER BY
    media_type,
    leg;
	
-- Q2: Summary isotope statistics by media type and leg
SELECT
    media_type,
    leg,
    COUNT(*)          AS n_samples,
    ROUND(AVG(d18o), 2)      AS mean_d18o,
    ROUND(AVG(dd), 2)        AS mean_dd,
    ROUND(AVG(d_excess), 2)  AS mean_d_excess,
    MIN(d18o)                AS min_d18o,
    MAX(d18o)                AS max_d18o,
    ROUND(STDDEV(d18o), 3)   AS sd_d18o
FROM ciasom_samples
WHERE d18o IS NOT NULL
GROUP BY
    media_type,
    leg
ORDER BY
    media_type,
    leg;

-- Q3: Rank legs by mean d18O for each media type (depletion ranking)
WITH media_leg_stats AS (
    SELECT
        media_type,
        leg,
        COUNT(*)    AS n_samples,
        AVG(d18o)   AS mean_d18o
    FROM ciasom_samples
    WHERE d18o IS NOT NULL
    GROUP BY
        media_type,
        leg
)
SELECT
    media_type,
    leg,
    n_samples,
    ROUND(mean_d18o, 2) AS mean_d18o,
    RANK() OVER (
        PARTITION BY media_type
        ORDER BY mean_d18o
    ) AS depletion_rank_in_media
FROM media_leg_stats
ORDER BY
    media_type,
    depletion_rank_in_media;

-- Q4: Mean isotopes by MOSAiC week and media type
WITH base AS (
    SELECT
        media_type,
        week_mosaic,
        d18o,
        dd,
        d_excess
    FROM ciasom_samples
    WHERE week_mosaic IS NOT NULL
      AND d18o IS NOT NULL
)
SELECT
    media_type,
    week_mosaic,
    COUNT(*)                   AS n_samples,
    ROUND(AVG(d18o), 2)        AS mean_d18o,
    ROUND(AVG(dd), 2)          AS mean_dd,
    ROUND(AVG(d_excess), 2)    AS mean_d_excess
FROM base
GROUP BY
    media_type,
    week_mosaic
ORDER BY
    media_type,
    week_mosaic;

-- Q5: Vertical isotope profile binned in 10 cm depth intervals
WITH depth_bins AS (
    SELECT
        media_type,
        leg,
        FLOOR(mean_depth / 10.0) * 10 AS depth_bin_cm,
        d18o
    FROM ciasom_samples
    WHERE mean_depth IS NOT NULL
      AND d18o IS NOT NULL
)
SELECT
    media_type,
    leg,
    depth_bin_cm,
    COUNT(*)              AS n_samples,
    ROUND(AVG(d18o), 2)   AS mean_d18o
FROM depth_bins
GROUP BY
    media_type,
    leg,
    depth_bin_cm
ORDER BY
    media_type,
    leg,
    depth_bin_cm;

-- Q6: Potential duplicate sample IDs (should normally be unique)
SELECT
    sample_ciasom_id,
    COUNT(*) AS occurrences
FROM ciasom_samples
WHERE sample_ciasom_id IS NOT NULL
GROUP BY
    sample_ciasom_id
HAVING COUNT(*) > 1
ORDER BY
    occurrences DESC,
    sample_ciasom_id;

-- Q7: Missing spatial metadata by media type
SELECT
    media_type,
    COUNT(*) AS n_samples,
    SUM(CASE WHEN latitude  IS NULL THEN 1 ELSE 0 END) AS n_missing_lat,
    SUM(CASE WHEN longitude IS NULL THEN 1 ELSE 0 END) AS n_missing_lon
FROM ciasom_samples
GROUP BY media_type
ORDER BY media_type;

-- Q8: Conceptual rebuild combining media-specific subsets
WITH snow AS (
    SELECT * FROM ciasom_samples WHERE media_type = 'Snow'
),
seawater AS (
    SELECT * FROM ciasom_samples WHERE media_type = 'Seawater'
),
ice AS (
    SELECT * FROM ciasom_samples WHERE media_type = 'ICE'
)
SELECT * FROM snow
UNION ALL
SELECT * FROM seawater
UNION ALL
SELECT * FROM ice;