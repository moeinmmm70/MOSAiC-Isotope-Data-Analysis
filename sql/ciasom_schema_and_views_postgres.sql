-- Drop old views
DROP VIEW IF EXISTS v_snow;
DROP VIEW IF EXISTS v_seawater;
DROP VIEW IF EXISTS v_melt_pond;
DROP VIEW IF EXISTS v_brine;
DROP VIEW IF EXISTS v_snow_leg1;

-- Media-specific views
CREATE VIEW v_snow AS
SELECT *
FROM ciasom_samples
WHERE media_type = 'Snow';

CREATE VIEW v_seawater AS
SELECT *
FROM ciasom_samples
WHERE media_type = 'Seawater';

CREATE VIEW v_melt_pond AS
SELECT *
FROM ciasom_samples
WHERE media_type = 'Melt_Pond';

CREATE VIEW v_brine AS
SELECT *
FROM ciasom_samples
WHERE media_type = 'Brine';

-- Explicit example: snow_leg1
CREATE VIEW v_snow_leg1 AS
SELECT *
FROM ciasom_samples
WHERE media_type = 'Snow'
  AND leg = 1;