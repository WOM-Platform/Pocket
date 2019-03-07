//Shared Preferences
const IS_FIRST_OPEN = 'isFirstOpen';
const IS_SUGGESTIONS_DISABLED = 'isSuggestionsDisabled';
const IS_FAKE_MODE = 'isFakeMode';

//Image Path
const IMAGE_PATH_INTRO_1 = 'assets/images/team.png';
const IMAGE_PATH_INTRO_2 = 'assets/images/piggy-bank.png';
const IMAGE_PATH_INTRO_3 = 'assets/images/shop.png';

//URL
const URL_REDEEM = 'http://wom.social/api/v1/voucher/redeem';
const URL_CONFIRM = 'http://wom.social/api/v1/payment/confirm';
const URL_INFO_PAY = 'http://wom.social/api/v1/payment/info';

const ALPHANUMERIC_CHARS = "abcdefghijklmnopqrstuvwxyz0123456789";

//Registry Public Key
const String PUBLIC_KEY =
    "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA4gsUmdpM7LzpviixpBx8" +
        "0SO4t8NScnyzHngBSk9Vd9ECq8Q9Cc8b5KVQLTm+KVemzlFk4Cw1VwrwtiS8wZhJ" +
        "FrVmaViKiylExyvBc3sMBkavPlCaQXmc2thJge5uApn8rAX3U4tsh0JZPOgKr1KS" +
        "S9V3ZMKjWWxQ51ftQEXTphDy58LMQXmvxWe6cfHaNvXs8kyS6zAdO0Fri198eYxR" +
        "cX97ADtk6nTU8bBth3PTbsr3iyPyuH553nez4LejtmJDQYZvr0UaEGstiP5ZVuPD" +
        "sPndfJbjVLTRcEy50n8jBTDDLNebXBCbAEuScRTE1ja8wBXE8MRvGJIO7kpZTe7o" +
        "GPRfb7NjYb4+oY2VSrwbVKhsWvCkmFTXZzdGxcZM/upGTrVmegeBngU1TWcceS+7" +
        "TTe1pLTZfwzEVNs1GtYW1edC9ljw3UOYbhNEtlY6G+Zh7UEDSvuCk1k+tw9zicTA" +
        "k0MkIwMUurloQSobRxGVS0YFBiOQl11dAB8zGjWzjSvu1pezsCdeCZSTZNb5hF7p" +
        "vdC7s63YG9pztDVwCiYtWzns1OI15KTMYyoiShv4vSS1wou+O0VVN5Bmly/+4MWC" +
        "krXDLR4jFb4ioOuia4fJ7m9detyA9dHNpkAgwm0nNErGY1kaO9PqNUx0mDL+peve" +
        "SWThamgdlgxxOvr07dx+HEcCAwEAAQ==";


const String PUBLIC_KEY_HEADER =
    "-----BEGIN PUBLIC KEY-----" +
        "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA4gsUmdpM7LzpviixpBx8" +
        "0SO4t8NScnyzHngBSk9Vd9ECq8Q9Cc8b5KVQLTm+KVemzlFk4Cw1VwrwtiS8wZhJ" +
        "FrVmaViKiylExyvBc3sMBkavPlCaQXmc2thJge5uApn8rAX3U4tsh0JZPOgKr1KS" +
        "S9V3ZMKjWWxQ51ftQEXTphDy58LMQXmvxWe6cfHaNvXs8kyS6zAdO0Fri198eYxR" +
        "cX97ADtk6nTU8bBth3PTbsr3iyPyuH553nez4LejtmJDQYZvr0UaEGstiP5ZVuPD" +
        "sPndfJbjVLTRcEy50n8jBTDDLNebXBCbAEuScRTE1ja8wBXE8MRvGJIO7kpZTe7o" +
        "GPRfb7NjYb4+oY2VSrwbVKhsWvCkmFTXZzdGxcZM/upGTrVmegeBngU1TWcceS+7" +
        "TTe1pLTZfwzEVNs1GtYW1edC9ljw3UOYbhNEtlY6G+Zh7UEDSvuCk1k+tw9zicTA" +
        "k0MkIwMUurloQSobRxGVS0YFBiOQl11dAB8zGjWzjSvu1pezsCdeCZSTZNb5hF7p" +
        "vdC7s63YG9pztDVwCiYtWzns1OI15KTMYyoiShv4vSS1wou+O0VVN5Bmly/+4MWC" +
        "krXDLR4jFb4ioOuia4fJ7m9detyA9dHNpkAgwm0nNErGY1kaO9PqNUx0mDL+peve" +
        "SWThamgdlgxxOvr07dx+HEcCAwEAAQ==" +
        "-----END PUBLIC KEY-----";

const int oneDayInMilliseconds = 86400;