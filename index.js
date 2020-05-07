import { NativeModules } from 'react-native';

// const { Conekta } = NativeModules;
// export default Conekta;

export default class Conekta {
    publicKey = null;
    constructor() {}

    setPublicKey = (key) => {
        this.publicKey = key;
    }

    createToken = (info: Object, success: Function, error: Function) => {
        const data = {...info, publicKey: this.publicKey}
        NativeModules.Conekta.createToken(data, function (response) {
            if (Platform.OS === 'android') {
                success(JSON.parse(response));
            } else {
                success(response);
            }
        }, error);
    }
};
