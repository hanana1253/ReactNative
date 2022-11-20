open ReactNative
let styles = {
  open Style
  StyleSheet.create({
    "title": textStyle(
      ~fontSize=24.,
      ~fontWeight=#bold,
      ~color="#ddb52f",
      ~textAlign=#center,
      ~borderWidth=2.,
      ~borderColor="#ddb52f",
      ~padding=12.->dp,
      (),
    ),
  })
}

@react.component
let make = (~children) => {
  <Text style={styles["title"]}> {children} </Text>
}
