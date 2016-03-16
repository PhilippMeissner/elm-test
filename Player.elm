module Player where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


-- MODEL
type alias Model = {
  left: Int,
  top: Int,
  bottom: Int,
  right: Int
}

-- Initiate the Model with 0 0 0 0
init: Int -> Int -> Int -> Int -> Model
init l t b r = {
  left = l,
  top = t,
  bottom = b,
  right = r
  }

-- UPDATE
type Action = GoLeft | GoTop | GoBottom | GoRight

update: Action -> Model -> Model
update action model =
  case action of
    GoLeft ->
      model.left + 1
    GoTop ->
      model.top + 1
    GoBottom ->
      model.bottom +1
    GoRight ->
      model.right + 1

-- VIEW
view: Signal.Address Action -> Model -> Html
view address model =
  div []
    [ button [ onClick address GoLeft ] [ text "LEFT" ],
    button [ onClick address GoTop ] [ text "UP" ],
    button [ onClick address GoBottom ] [ text "DOWN" ],
    button [ onClick address GoRight ] [ text "RIGHT"],
    div [ pewStyle ] [ text (toString model) ]
    ]


pewStyle : Attribute
pewStyle =
  style
    [
      ("height", "100px"),
      ("width", "100px"),
      ("background-color", "red")
    ]
