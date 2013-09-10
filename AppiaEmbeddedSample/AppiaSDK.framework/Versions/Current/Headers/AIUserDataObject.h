//
//  AIUserData.h
//  AppiaSDK
//
//  Created by Douglas Ivers on 5/15/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#define throwExceptionsFlag NO
// age options in addition to integers
#define allowedAgeList_userData @[@"unknown"]
// sex options
#define allowedSexList_userData @[@"male",@"female",@"unknown"]
// income options in addition to integers
#define allowedIncomeList_userData @[@"unknown"]
// children options in addition to integers
#define allowedChildrenList_userData @[@"true",@"false",@"unknown"]
// education achievement options
#define educationList_userData @[@"highschool",@"incollege",@"somecollege",@"associate",@"bachelors",@"masters",@"phd",@"professional",@"unknown"]
// marital status options
#define maritalStatusList_userData @[@"single",@"divorced",@"engaged",@"relationship",@"unknown"]
// political affiliation options
#define politicalAffiliationList_userData @[@"republican",@"democrat",@"conservative",@"moderate",@"liberal",@"independent",@"other",@"unknown"]


@interface AIUserDataObject : NSObject

@property (nonatomic, copy) NSString *age;                      // integer age in units of years
@property (nonatomic, copy) NSString *sex;                      // male, female, or unknown
@property (nonatomic, copy) NSString *income;                   // integer income in US dollars
@property (nonatomic, copy) NSString *children;                 // number of children living
@property (nonatomic, copy) NSString *zipCode;                  // any string
@property (nonatomic, copy) NSString *education;                // see allowed strings in #define
@property (nonatomic, copy) NSString *maritalStatus;            // see allowed strings in #define
@property (nonatomic, copy) NSString *politicalAffiliation;     // see allowed strings in #define
@property (nonatomic, copy) NSString *keywords;                 // separate by semi-colons, not commas and no spaces

-(NSString*)buildPartialQueryString;

@end
