module.exports = {
  responseDto: (err, value, res) => {
    if (err) {
      console.error(`!!ERROR!! : ${err}`);
      return res.status(500).send(err.message);
    } else {
      if (value === null) {
        return res.status(404).send("Not Found Data");
      } else {
        return res.status(200).json(value);
      }
    }
  },
};
