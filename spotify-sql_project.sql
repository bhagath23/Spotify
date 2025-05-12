--Q.13)Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
SELECT * FROM spotify;

WITH energy_difference AS(
SELECT album,
MAX(energy) AS max_energy,
MIN(energy) AS min_energy
FROM spotify
GROUP BY album
)
SELECT album,
max_energy - min_energy AS difference_of_energy
FROM energy_difference;

--Q.14)Find tracks where the energy-to-liveness ratio is greater than 1.2.
SELECT * FROM spotify;

WITH ratio AS (
SELECT track,energy/liveness AS ratio_between FROM spotify
)
SELECT track,ratio_between FROM ratio
WHERE ratio_between > 1.2
ORDER BY 2 ASC;

--Q.15)Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
SELECT * FROM spotify;

SELECT track,views,likes,SUM(likes) OVER (ORDER BY views DESC) AS cumulative_views
FROM spotify;























