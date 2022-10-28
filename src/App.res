open ReactNative


let styles = StyleSheet.create({
  open Style
  {
    "rootScreen": viewStyle(~backgroundColor="#ddb52f", ~flex=1., ()),
  }
})

@react.component
let app = () => {

  <View style={styles["rootScreen"]}>
    <StartGame />
  </View>
}
