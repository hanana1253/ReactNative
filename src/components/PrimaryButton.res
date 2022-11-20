open ReactNative

let styles = {
  open Style
  StyleSheet.create({
    "buttonOuterContainer": viewStyle(~borderRadius=28., ~margin=4.->dp, ~overflow=#hidden, ()),
    "buttonInnerContainer": viewStyle(
      ~backgroundColor="#72063c",
      ~paddingVertical=8.->dp,
      ~paddingHorizontal=16.->dp,
      ~elevation=2.,
      (),
    ),
    "buttonText": textStyle(~textAlign=#center, ~color="#fff", ()),
    "pressed": style(~opacity=0.5, ()),
  })
}
@react.component
let make = (~label, ~onPress) => {
  <View style={styles["buttonOuterContainer"]}>
    <Pressable
      style={({pressed}) =>
        pressed
          ? [styles["pressed"], styles["buttonInnerContainer"]]->Style.array
          : styles["buttonInnerContainer"]}
      onPress
      android_ripple={Pressable.rippleConfig(~color="#640233", ())}>
      {_ => <Text style={styles["buttonText"]}> {label->React.string} </Text>}
    </Pressable>
  </View>
}
