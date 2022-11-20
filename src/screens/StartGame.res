open ReactNative

let styles = {
  open Style
  StyleSheet.create({
    "inputContainer": viewStyle(
      ~margin=100.->dp,
      ~marginHorizontal=24.->dp,
      ~padding=16.->dp,
      ~backgroundColor="#4e0329",
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
      ~borderBottomColor="#ddb52f",
      ~borderBottomWidth=2.,
      ~color="#ddb52f",
      ~marginVertical=8.->dp,
      ~fontWeight=#_700,
      ~textAlign=#center,
      (),
    ),
  })
}

@react.component
let make = () => {
  <View style={styles["inputContainer"]}>
    <TextInput
      style={styles["numberInput"]}
      maxLength=2
      keyboardType=#numberPad
      autoCapitalize=#none
      autoCorrect=false
    />
    <View style={styles["buttonsContainer"]}>
      <View style={styles["buttonContainer"]}>
        <PrimaryButton label="Reset" />
      </View>
      <View style={styles["buttonContainer"]}>
        <PrimaryButton label="Confirm" />
      </View>
    </View>
  </View>
}
