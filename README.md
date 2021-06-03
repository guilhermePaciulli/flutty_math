# Flutty math

> A simple math game made in Flutter for studying purposes.

## Motivation

Study Flutter layout building as one of the growing the technologies in hybrid development, for both iOS and Android, with this power it's possible to reach more people with less lines of code.

For now, I don't have the intention to apply design patterns or tests, most of this challenge was created to understand how Flutter builds it's layout, common tools for VSCode, simple animations, state changing and User Defaults/Shared preferences.

## Proposal

Create a simple math game where the user selects among other 8, the right answer for a minus or plus question, _e.g._ 9 + 10 = 19, for each right answer the user receives a point and at the end of the round he receives a score which can go to a leaderboard stored in his phone.

## Results

<p align="center">
    <img src="/record.gif" width="200">
</p>

To each question user has 5 seconds to select the right answer, past this time the user is pushed to next view.

By selecting a wrong answer the user is pushed to the next question and no points are gained.

If he selects a right asnwer the user gains a point and is pushed to next view.

Each round has nine questions.

## Usage

Flutter is required, just clone the project and hit `flutter run` in the terminal.

## Future

* Use Flutter's design system in a more efficient way.
* Write tests to avoid some seen odd behaviours while going back to another round.
* Implement the information screen with details about me as a developer.
* Recreate the in-game screen to be more efficient in terms of animations.

> Despite these future bullet-points, I don't intend to implement them right now, I'll be focused on creating more complex apps and understanding design patterns and flutter unit testing.

## Credits

<div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>