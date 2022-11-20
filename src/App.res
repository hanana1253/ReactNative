open ReactNative
open Colors

let styles = StyleSheet.create({
  open Style
  {
    "rootScreen": viewStyle(~flex=1., ()),
    "backgroundImage": imageStyle(~opacity=0.15, ()),
  }
})

@react.component
let app = () => {
  let (userNumber, setUserNumber) = React.Uncurried.useState(_ => None)
  let pickedNumberHandler = pickedNumber => setUserNumber(._ => pickedNumber)
  <LinearGradient colors={[colors["primary700"], colors["accent500"]]} style={styles["rootScreen"]}>
    <ImageBackground
      source={Image.Source.fromRequired(Packager.require("../assets/images/background.png"))}
      resizeMode=#cover
      style={styles["rootScreen"]}
      imageStyle={styles["backgroundImage"]}>
      <SafeAreaView style={styles["rootScreen"]}>
        {userNumber->Belt.Option.isSome
          ? <GameScreen />
          : <StartGameScreen onPickNumber=pickedNumberHandler />}
      </SafeAreaView>
    </ImageBackground>
  </LinearGradient>
}
