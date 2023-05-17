CREATE TABLE framingham (
	male varchar(1) not null,
	age	int not null,
	education	varchar(5),
	currentSmoker	varchar(5),
	cigsPerDay	varchar(5),
	BPMeds	varchar(5),
	prevalentStroke	varchar(5),
	prevalentHyp	varchar(5),
	diabetes	varchar(5),
	totChol	varchar(5),
	sysBP	float,
	diaBP	float,
	BMI	varchar(5),
	heartRate	varchar(5),
	glucose	varchar(5),
    TenYearCHD varchar(1)
);

SELECT row_number() over (order by (select 1)) as patientid, *
INTO framinghamid
FROM framingham;

delete from framinghamid
 where totchol='NA' or heartrate='NA' or bmi='NA' or bpmeds='NA';

SELECT patientid, male,age,education,currentSmoker,cigsperDay,BPMeds,TenYearCHD
INTO demog
FROM framinghamid;

SELECT patientid, totChol,sysBP,diaBP,BMI,heartRate,glucose
INTO measures
FROM framinghamid;

SELECT patientid, prevalentStroke,prevalentHyp,diabetes
INTO comorbidities
FROM framinghamid;

select count(male), male, tenyearchd
from demog
group by tenyearchd,male;

select count(education),education
from demog
group by education;
-- 105 NA for education

select count(currentsmoker),currentsmoker
from demog
group by currentsmoker;

select count(cigsperday),cigsperday,currentsmoker
from demog
group by currentsmoker,cigsperday
order by cigsperday;
--29 NAs for current smokers can set those to the mean

select avg(cast(cigsperday as int))
from demog
where currentsmoker='1' and cigsperday !='NA';

select distinct(bpmeds)
from demog;

select count(bpmeds),bpmeds
from demog
group by bpmeds;
--53 NAs for bpmeds

alter table demog
 drop column education;
 
 alter table measures
 drop column glucose;
 
 select count(*) from demog;
 select count(*) from measures;
 select count(*) from comorbidities;
 
 update demog
  set cigsperday='18' 
  where cigsperday='NA' and
    currentsmoker='1';
 








