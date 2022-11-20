open ReactNative
open Colors

let styles = {
  open Style
  StyleSheet.create({
    "screen": viewStyle(~flex=1.0, ~padding=24.->dp, ()),
    "title": textStyle(
      ~fontSize=24.,
      ~fontWeight=#bold,
      ~color=colors["accent500"],
      ~textAlign=#center,
      ~borderWidth=2.,
      ~borderColor=colors["accent500"],
      ~padding=12.->dp,
      (),
    ),
  })
}

@react.component
let make = () => {
  <View style={styles["screen"]}>
    <Title> {"Opponent's guess"->React.string} </Title>
    <View>
      <Text> {"Higher or lower?"->React.string} </Text>
    </View>
  </View>
}
