SELECT PW.PlatformName,
PW.id AS Id,
PW.platformId AS PlatformId,
PW.uniqueName AS UniqueName,
PW.latitude AS Latitude,
PW.longitude AS Longitude,
PW.createdAt AS CreatedAt,
PW.updatedAt AS UpdatedAt
FROM (
SELECT p.uniqueName AS PlatformName ,W.*, ROW_NUMBER() OVER(PARTITION BY W.platformId ORDER BY W.updatedAt DESC) AS rn
FROM [dbo].[Well] W
JOIN [dbo].[Platform] P ON W.platformId = P.id
) AS PW
where rn = 1