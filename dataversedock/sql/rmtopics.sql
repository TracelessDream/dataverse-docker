delete from controlledvocabularyvalue where identifier like '%D%' and datasetfieldtype_id=20 and strvalue!='Social Sciences';
update datasetfieldtype set title='Translated Title' where name='alternativeTitle';
