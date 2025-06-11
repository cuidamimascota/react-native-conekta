# react-native-conekta [![npm version](https://badge.fury.io/js/%40cuidamimascota%2Freact-native-conekta.svg)](https://badge.fury.io/js/%40cuidamimascota%2Freact-native-conekta)

## ⚠️ NOT OFFICIAL

## Getting started

Using npm:

```shell
npm install --save @cuidamimascota/react-native-conekta
```

or using yarn:

```shell
yarn add @cuidamimascota/react-native-conekta
```

```shell
cd ios
pod install
```

> ⚠️ Need React Native >=0.63.3

## Usage
```javascript
import Conekta from '@cuidamimascota/react-native-conekta';
var conektaApi = new Conekta();

conektaApi.setPublicKey('YOUR_PUBLIC_KEY');

conektaApi.createToken({
  cardNumber: '4242424242424242',
  name: 'Manolo Virolo',
  cvc: '111',
  expMonth: '11',
  expYear: '21',
}, function(data){
  console.log( 'DATA:', { data } ); // data.id to get the Token ID
}, function(){
  console.log( 'Error!' );
});
```
