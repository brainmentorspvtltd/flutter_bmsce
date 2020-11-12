double computeBMI(int weight, int height) {
  double heightInMeter = height / 100;
  heightInMeter = heightInMeter * heightInMeter;
  return weight / heightInMeter;
}
