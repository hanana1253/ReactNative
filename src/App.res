open ReactNative

let styles = StyleSheet.create({
  open Style
  {
    "rootScreen": viewStyle(~backgroundColor="#ddb52f", ~flex=1., ()),
  }
})

@react.component
let app = () => {
  <LinearGradient colors={["#4e0329", "#ddb52f"]} style={styles["rootScreen"]}>
    <StartGame />
  </LinearGradient>
}
