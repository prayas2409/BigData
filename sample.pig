lines = LOAD '/user/hduser/user/hduser/data/wordcount.txt' USING PigStorage('\n') AS (line:CHARARRAY); 
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line,' ')) AS word;
grouped = GROUP words BY word;
wordcounte = FOREACH grouped GENERATE group, COUNT(words);
DUMP wordcounte;
