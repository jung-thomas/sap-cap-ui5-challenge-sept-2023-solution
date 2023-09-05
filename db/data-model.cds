using { cuid, managed } from '@sap/cds/common'; 

namespace fullstack_dev_challenge; 

@fiori.draft.enabled
entity Tests: cuid, managed { 
  questions : Association to many Questions on questions.test = $self;
  title : localized String;
  description : localized String;
} 

entity Questions : cuid { 
  test : Association to Tests;
  text: String;
  answer: Composition of one Answers;
} 

aspect Answers : cuid { 
  text: String;
} 

