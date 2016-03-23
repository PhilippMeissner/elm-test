module Main (..) where

import Html exposing (div, button, text, img)
import Html.Attributes exposing (style, src)
import Html.Events exposing (onClick)
import Signal
import StartApp
import Effects exposing (Never)
import Task
import Keyboard
import Char


app : StartApp.App Model
app =
  StartApp.start
    { init = init
    , view = view
    , update = update
    , inputs = [ Signal.map spaceToInc Keyboard.presses ]
    }


main : Signal Html.Html
main =
  app.html


init : ( Model, Effects.Effects a )
init =
  ( initialModel, Effects.none )


type alias Model =
  { x : Int
  , y : Int
  }


initialModel : Model
initialModel =
  { x = 2, y = 10 }



-- (view) This is what the compiler told me. Why not:
-- view: Signal.Address -> {x: number, y: number} -> Html.Html


view : Signal.Address Action -> { c | x : a, y : b } -> Html.Html
view address model =
  div
    []
    [ button
        [ style
            [ ( "display", "block" )
            , ( "width", "100px" )
            , ( "margin-left", "100px" )
            ]
        , onClick address Up
        ]
        [ text "Up" ]
    , button
        [ buttonStyle
        , onClick address Left
        ]
        [ text "Left" ]
    , button
        [ buttonStyle
        , onClick address Down
        ]
        [ text "Down" ]
    , button
        [ buttonStyle
        , onClick address Right
        ]
        [ text "Right" ]
    , img
        [ src ("mario.jpg")
        , style
            [ ( "width", "100px" )
            , ( "position", "absolute" )
            , ( "left", toString model.x ++ "%" )
            , ( "bottom", toString model.y ++ "%" )
            ]
        ]
        []
    ]


type Action
  = Left
  | Right
  | Down
  | Up
  | NoOp


update : Action -> Model -> ( Model, Effects.Effects b )
update action model =
  case action of
    NoOp ->
      ( model
      , Effects.none
      )

    Left ->
      ( { model | x = model.x - 1 }
      , Effects.none
      )

    Right ->
      ( { model | x = model.x + 1 }
      , Effects.none
      )

    Down ->
      ( { model | y = model.y - 1 }
      , Effects.none
      )

    Up ->
      ( { model | y = model.y + 1 }
      , Effects.none
      )


type alias Keys =
  { x : Int
  , y : Int
  }



-- Change this to not receive keyCode but a struct of {x: Int, y: Int} (Keyboard.wasd)


spaceToInc : Int -> Action
spaceToInc keyCode =
  case (Char.fromCode keyCode) of
    'a' ->
      Left

    'w' ->
      Up

    's' ->
      Down

    'd' ->
      Right

    _ ->
      NoOp


port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks


buttonStyle : Html.Attribute
buttonStyle =
  style
    [ ( "width", "100px" ) ]
