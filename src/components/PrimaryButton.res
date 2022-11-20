open ReactNative

let styles = {
  open Style
  StyleSheet.create({
    "buttonOuterContainer": viewStyle(~borderRadius=28., ~margin=4.->dp, ~overflow=#hidden, ()),
    "buttonInnerContainer": viewStyle(
      ~backgroundColor=Colors.colors["primary600"],
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
let make = (~children, ~onPress) => {
  <View style={styles["buttonOuterContainer"]}>
    <Pressable
      style={({pressed}) =>
        pressed
          ? [styles["pressed"], styles["buttonInnerContainer"]]->Style.array
          : styles["buttonInnerContainer"]}
      onPress
      android_ripple={Pressable.rippleConfig(~color=Colors.colors["primary500"], ())}>
      {_ => <Text style={styles["buttonText"]}> {children} </Text>}
    </Pressable>
  </View>
}
