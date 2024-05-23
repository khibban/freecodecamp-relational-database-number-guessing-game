#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT username FROM usertable WHERE username = '$USERNAME' ")
USER_ID=$($PSQL "SELECT user_id FROM usertable WHERE username = '$USERNAME'")

if [[ -z $USER_DATA ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO usertable(username) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM usertable WHERE username = '$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM game  WHERE user_id = '$USER_ID' ")
  BEST_GAME=$($PSQL "SELECT MIN(guess_count) FROM game  WHERE user_id = '$USER_ID' ")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

INSERT_DATA=$($PSQL "INSERT INTO game(guess_count, user_id) VALUES (0, $USER_ID)")
GAME_ID=$($PSQL "SELECT game_id FROM game WHERE user_id = $USER_ID ORDER BY game_id DESC LIMIT 1")

SECRET_NUMBER=$(( (RANDOM % 1000) + 1 )) 
echo "Guess the secret number between 1 and 1000:"
read INPUT

GUESS_COUNT=1

while [[ $SECRET_NUMBER != $INPUT ]]
do

  if [[ ! $INPUT =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  elif [[ $INPUT -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $INPUT -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  fi
  read INPUT
  GUESS_COUNT=$((GUESS_COUNT + 1))
done

UPDATE_GUESS_COUNT=$($PSQL "UPDATE game SET guess_count = $GUESS_COUNT WHERE game_id = $GAME_ID")
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
