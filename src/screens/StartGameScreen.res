open ReactNative
open Colors

let styles = {
  open Style
  StyleSheet.create({
    "inputContainer": viewStyle(
      ~margin=100.->dp,
      ~marginHorizontal=24.->dp,
      ~padding=16.->dp,
      ~backgroundColor=colors["primary800"],
      ~borderRadius=8.,
      ~elevation=4.,
      ~shadowColor="black",
      ~shadowOffset=offset(~height=2., ~width=0.),
      ~shadowRadius=6.0,
      ~shadowOpacity=0.25,
      ~justifyContent=#center,
      ~alignItems=#center,
      (),
    ),
    "buttonsContainer": viewStyle(~flexDirection=#row, ()),
    "buttonContainer": viewStyle(~flex=1., ()),
    "numberInput": style(
      ~height=50.->dp,
      ~width=50.->dp,
      ~fontSize=32.,
      ~borderBottomColor=colors["accent500"],
      ~borderBottomWidth=2.,
      ~color=colors["accent500"],
      ~marginVertical=8.->dp,
      ~fontWeight=#_700,
      ~textAlign=#center,
      (),
    ),
  })
}

@react.component
let make = (~onPickNumber) => {
  let (enteredNumber, setEnteredNumber) = React.Uncurried.useState(_ => "")

  let numberInputHandler = enteredText => {
    setEnteredNumber(._ => enteredText)
  }

  let resetInputHandler = _ => {
    setEnteredNumber(._ => "")
  }

  let confirmInputHandler = _ => {
    let chosenNumber = enteredNumber->Belt.Int.fromString
    switch chosenNumber {
    | Some(number) if number > 0 && number <= 99 => onPickNumber(Some(number))
    | _ =>
      Alert.alert(
        ~title="Invalid number!",
        ~message="Number has to be a number between 1 and 99.",
        ~buttons=[Alert.button(~text="Okay", ~style=#default, ~onPress=resetInputHandler, ())],
        (),
      )
    }
  }

  <View style={styles["inputContainer"]}>
    <TextInput
      style={styles["numberInput"]}
      maxLength=2
      keyboardType=#numberPad
      autoCapitalize=#none
      autoCorrect=false
      value=enteredNumber
      onChangeText=numberInputHandler
    />
    <View style={styles["buttonsContainer"]}>
      <View style={styles["buttonContainer"]}>
        <PrimaryButton onPress=resetInputHandler> {"Reset"->React.string} </PrimaryButton>
      </View>
      <View style={styles["buttonContainer"]}>
        <PrimaryButton onPress=confirmInputHandler> {"Confirm"->React.string} </PrimaryButton>
      </View>
    </View>
  </View>
}
