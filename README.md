# react-native-conekta

## Getting started

Using npm:

```shell
npm install --save react-native-conekta
```

or using yarn:

```shell
yarn add react-native-conekta
```

```shell
cd ios
pod install
```

> ⚠️ React Native >=0.60.0

## Usage
```javascript
import Conekta from 'react-native-conekta';
var conektaApi = new Conekta();

conektaApi.setPublicKey( 'YOUR_PUBLIC_KEY' );

conektaApi.createToken({
  cardNumber: '4242424242424242',
  name: 'Manolo Virolo',
  cvc: '111',
  expMonth: '11',
  expYear: '21',
}, function(data){
  console.log( 'DATA:', data ); // data.id to get the Token ID
}, function(){
  console.log( 'Error!' );
});
```
