open ReactNative

let styles = StyleSheet.create({
  open Style
  {
    "rootScreen": viewStyle(~flex=1., ()),
    "backgroundImage": imageStyle(~opacity=0.15, ()),
  }
})

@react.component
let app = () => {
  <LinearGradient colors={["#4e0329", "#ddb52f"]} style={styles["rootScreen"]}>
    <ImageBackground
      source={Image.Source.fromRequired(Packager.require("../assets/images/background.png"))}
      resizeMode=#cover
      style={styles["rootScreen"]}
      imageStyle={styles["backgroundImage"]}>
      <StartGame />
    </ImageBackground>
  </LinearGradient>
}
