open ReactNative
let styles = {
  open Style
  StyleSheet.create({
    "screen": viewStyle(~flex=1.0, ~padding=24.->dp, ()),
  })
}

@react.component
let make = () => {
  <View style={styles["screen"]}>
    <Text> {"Opponent's guess"->React.string} </Text>
    <View>
      <Text> {"Higher or lower?"->React.string} </Text>
    </View>
  </View>
}
