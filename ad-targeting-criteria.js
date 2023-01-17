const listOfAds = require("./data/ad-engagements");

const listOfAdTargetingCriteria = listOfAds.map((obj) =>
  obj.ad.adsUserData.adEngagements.engagements
    .map(
      (attributes) => attributes.impressionAttributes.matchedTargetingCriteria
    )
    .reduce((ads, criteria) => {
      ads = ads.concat(criteria);
      return ads;
    }, [])
);

const allTargetingCriteria = listOfAdTargetingCriteria.reduce(
  (all, criteria) => {
    all = all.concat(criteria);
    return all;
  },
  []
);

const targetingTypes = allTargetingCriteria.reduce((types, criteria) => {
  if (criteria && !types[criteria.targetingType]) {
    if (!types[criteria.targetingType]) {
      types[criteria.targetingType] = [];
    }
    if (!types[criteria.targetingType].includes(criteria.targetingValue)) {
      types[criteria.targetingType].push(criteria.targetingValue);
    }
  }
  return types;
}, {});

console.log(targetingTypes);
