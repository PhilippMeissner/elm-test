Detected errors in 1 module.
-- TYPE MISMATCH ------------------------------------------------------ Main.elm

The argument to function `start` is causing a mismatch.

4│>       start {
5│>  model = 0 0 0 0,
6│>  update = update,
7│>  view = view
8│>  }

Function `start` is expecting the argument to be:

    { ...
    , update :
          Player.Action
          -> Player.Model
          -> { bottom : Int, left : Int, right : Int, top : Int }
    }

But it is:

    { ..., update : Player.Action -> Player.Model -> Int }

-- TYPE MISMATCH ------------------------------------------------------ Main.elm

You are giving 3 arguments to something that is not a function!

5│           0 0 0 0,
               ^^^^^
Maybe you forgot some parentheses? Or a comma?

