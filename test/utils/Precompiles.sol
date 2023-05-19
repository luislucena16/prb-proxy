// SPDX-License-Identifier: MIT
// solhint-disable max-line-length
pragma solidity >=0.8.18;

import { IPRBProxyAnnex } from "../../src/interfaces/IPRBProxyAnnex.sol";
import { IPRBProxyRegistry } from "../../src/interfaces/IPRBProxyRegistry.sol";

/// @notice This is useful for external integrations seeking to test against the exact deployed bytecode, as recompiling
/// with via IR enabled would be time-consuming.
contract Precompiles {
    error PRBProxy_Precompiles_DeploymentError();

    /// @notice Deploys {PRBProxyAnnex} from precompiled bytecode.
    function deployAnnex() public returns (IPRBProxyAnnex annex) {
        bytes memory bytecode =
            hex"60808060405234610016576105de908161001c8239f35b600080fdfe6080604081815260048036101561001557600080fd5b600092833560e01c90816309924a4014610474575080631f9838b51461042657806338a40908146103e35780634bddd93a1461030c5780638da5cb5b146102e45780639d159568146102c5578063aa4b826a14610235578063b96784031461012b5763ffa1ad741461008657600080fd5b346101275782600319360112610127578151908282019082821067ffffffffffffffff83111761011457508252600c81526020906b342e302e302d626574612e3360a01b8282015282519382859384528251928382860152825b8481106100fe57505050828201840152601f01601f19168101030190f35b81810183015188820188015287955082016100e0565b634e487b7160e01b855260419052602484fd5b8280fd5b503461012757602091826003193601126102315781356001600160a01b038116939084900361022d57815163ecdb286560e01b81528581858183895af1908115610223578691610201575b5080519384156101ea5750855b8481106101b35786867f88b2a910c369b31905e184140cbb1e5ec72817e11c4d6c5993f736716f8546598280a280f35b6001906001600160e01b03196101c982856105b4565b511688526002845284882080546001600160a01b0319168817905501610183565b835163b702f33560e01b8152908101869052602490fd5b61021d91503d8088833e61021581836104ef565b810190610527565b38610176565b83513d88823e3d90fd5b8480fd5b8380fd5b5050346102c15760603660031901126102c1576102506104be565b6102586104d9565b916044359081151580920361022d577f730824739164a9503317b3e878e816553b62d6763c1ba6df1390dea687e4d36c9160209160018060a01b038095169485885260038452818820961695868852835280872060ff1981541660ff841617905551908152a380f35b5080fd5b5050346102c157816003193601126102c1576020906001549051908152f35b5050346102c157816003193601126102c157905490516001600160a01b039091168152602090f35b503461012757602091826003193601126102315781356001600160a01b038116939084900361022d57815163ecdb286560e01b81528581858183895af19081156102235786916103c9575b5080519384156101ea5750855b8481106103945786867f7207021e3ba5dd0d191feb5efcbb1a8dcf615fa597fc5e1a49ecc13c2b7dd92b8280a280f35b6001906001600160e01b03196103aa82856105b4565b511688526002845284882080546001600160a01b031916905501610364565b6103dd91503d8088833e61021581836104ef565b38610357565b5034610127576020366003190112610127573563ffffffff60e01b811680910361012757825260026020908152918190205490516001600160a01b039091168152f35b5050346102c157806003193601126102c15760ff816020936104466104be565b61044e6104d9565b6001600160a01b0391821683526003875283832091168252855220549151911615158152f35b8493915034610231576020366003190112610231577f23252a6e1daaff91840b1504bf51e39c1d2a1b91b42d4911c348dc1bc462b61092356001548160015582526020820152a180f35b600435906001600160a01b03821682036104d457565b600080fd5b602435906001600160a01b03821682036104d457565b90601f8019910116810190811067ffffffffffffffff82111761051157604052565b634e487b7160e01b600052604160045260246000fd5b9060209081838203126104d457825167ffffffffffffffff938482116104d4570181601f820112156104d4578051938411610511578360051b9060405194610571858401876104ef565b855283808601928201019283116104d4578301905b828210610594575050505090565b81516001600160e01b0319811681036104d4578152908301908301610586565b80518210156105c85760209160051b010190565b634e487b7160e01b600052603260045260246000fd";
        assembly {
            annex := create(0, add(bytecode, 0x20), mload(bytecode))
        }
        if (address(annex) == address(0)) {
            revert PRBProxy_Precompiles_DeploymentError();
        }
    }

    /// @notice Deploys {PRBProxyRegistry} from precompiled bytecode.
    function deployRegistry() public returns (IPRBProxyRegistry registry) {
        bytes memory bytecode =
            hex"60808060405234610016576111dc908161001c8239f35b600080fdfe608060408181526004918236101561001657600080fd5b600090813560e01c908163092af81314610484575080632c27a01f1461044d57806374912cd2146103d5578063775c300c146103655780638fa3425c1461033c578063c455279114610301578063d632522114610242578063f2fde38b146100ff5763ffa1ad741461008757600080fd5b346100fc57806003193601126100fc575080519080820182811067ffffffffffffffff8211176100e7576100e393508152600c82526b342e302e302d626574612e3360a01b602083015251918291602083526020830190610584565b0390f35b604184634e487b7160e01b6000525260246000fd5b80fd5b50913461023e57602036600319011261023e5761011a610518565b6001600160a01b038082168086526001602052848620549094929082168061020f575050338552600160205281852054169182156101f95733855260016020528185206001600160601b0360a01b908181541690558486528383872091825416179055823b156101f557815163f2fde38b60e01b8152908101849052848160248183875af180156101eb576101d8575b50519081527f6954f1cdad46901994f29d9b1f78744c873c527bad04d294b4954cc8caf367da60203392a380f35b6101e4909491946105ce565b92386101aa565b82513d87823e3d90fd5b8480fd5b6024915190636b3d7d8760e01b82523390820152fd5b83516356352f0b60e11b81526001600160a01b0392831686820190815291909216602082015281900360400190fd5b8280fd5b5090346102fd5760603660031901126102fd5761025d610518565b6001600160a01b039390929060243590858216820361023e576044359567ffffffffffffffff87116102f95761029885969736908401610533565b95909482891681526001602052205416806102ca576100e3866102bd8787878c61074c565b92909151928392836105a9565b85516356352f0b60e11b81526001600160a01b0380891693820193845290911660208301529081906040010390fd5b8380fd5b5080fd5b5090346102fd5760203660031901126102fd576020916001600160a01b039082908261032b610518565b168152600185522054169051908152f35b5090346102fd57816003193601126102fd5760025490516001600160a01b039091168152602090f35b50346100fc57806003193601126100fc573381526001602052819020546001600160a01b0390811692836103a857602083836103a03361061a565b915191168152f35b91516356352f0b60e11b8152339281019283526001600160a01b0390931660208301525081906040010390fd5b50913461023e57602036600319011261023e5781906103f2610518565b6001600160a01b0380821686526001602052929094205482168061041d5750506103a060209361061a565b92516356352f0b60e11b81526001600160a01b039485169181019182529390921660208301525081906040010390fd5b5090346102fd5760203660031901126102fd5760209181906001600160a01b03610475610518565b16815280845220549051908152f35b9050346102fd57826003193601126102fd5761049e610518565b9060243567ffffffffffffffff81116102f9576104be9036908701610533565b33855260016020529385902054939590936001600160a01b031690816104ee576100e3866102bd8988883361074c565b6356352f0b60e11b8352339083019081526001600160a01b03909116602082015281906040010390fd5b600435906001600160a01b038216820361052e57565b600080fd5b9181601f8401121561052e5782359167ffffffffffffffff831161052e576020838186019501011161052e57565b60005b8381106105745750506000910152565b8181015183820152602001610564565b9060209161059d81518092818552858086019101610561565b601f01601f1916010190565b6001600160a01b0390911681526040602082018190526105cb92910190610584565b90565b67ffffffffffffffff81116105e257604052565b634e487b7160e01b600052604160045260246000fd5b90601f8019910116810190811067ffffffffffffffff8211176105e257604052565b32600081815260208181526040808320548151928301948552828201819052949594929390929161065881606081015b03601f1981018352826105f8565b5190209160018060a01b03809616936001600160601b0360a01b968588600254161760025582516108238082019082821067ffffffffffffffff8311176107385791809188936109b98339039084f5801561072e57907f6aafca263a35a9d2a6e4e4659a84688092f4ae153df2f95cd7659508d95c1870939291169780600254166002558682526001602052888383209182541617905532815280602052816001850191205551806107298833963296849192604091949360608401958452602084015260018060a01b0316910152565b0390a4565b83513d84823e3d90fd5b634e487b7160e01b85526041600452602485fd5b90939132600052600060205260406000205493604051602081019061078b8161064a89328660209093929193604081019460018060a01b031681520152565b51902091306001600160601b0360a01b6002541617600255604051610823908181019181831067ffffffffffffffff8411176105e257859282916109b9833903906000f590811561092257606460009260018060a01b0316986001600160601b0360a01b6002541660025560018060a01b03871684526001602052604084208a6001600160601b0360a01b82541617905532845283602052600189016040852055846040519586948593631cff79cd60e01b855260018060a01b0316600485015260406024850152816044850152848401378181018301859052601f01601f19168101030181838a5af19081156109225760009161092e575b5093853b1561052e5760405163f2fde38b60e01b81526001600160a01b0384166004820152600081602481838b5af1801561092257610913575b506040805191825260208201929092526001600160a01b0386811692820192909252911690339032907f6aafca263a35a9d2a6e4e4659a84688092f4ae153df2f95cd7659508d95c1870908060608101610729565b61091c906105ce565b386108be565b6040513d6000823e3d90fd5b90503d806000833e61094081836105f8565b81019060208183031261052e5780519067ffffffffffffffff821161052e570181601f8201121561052e57805167ffffffffffffffff81116105e25760405192610994601f8301601f1916602001856105f8565b8184526020828401011161052e576109b29160208085019101610561565b3861088456fe60a080604052346100f357611388600155336080526323e8d09760e21b8152602081600481335afa9081156100e757600091610076575b50600080546001600160a01b0319166001600160a01b039290921691909117905560405161072a90816100f9823960805181818161023601526102d00152f35b60203d81116100e0575b601f8101601f191682016001600160401b038111838210176100cc576020918391604052810103126100c85751906001600160a01b03821682036100c5575038610036565b80fd5b5080fd5b634e487b7160e01b84526041600452602484fd5b503d610080565b6040513d6000823e3d90fd5b600080fdfe60806040526004361015610027575b36156100255761001d36610463565b602081519101f35b005b6000803560e01c9081631cff79cd1461009a575080631f9838b51461009557806338a40908146100905780637b1039991461008b5780638da5cb5b146100865780639d159568146100815763f2fde38b0361000e576102ac565b61028e565b610265565b610220565b6101db565b610178565b6040366003190112610106576100ae610109565b60243567ffffffffffffffff928382116101065736602383011215610106578160040135938411610106573660248584010111610106576101026100f6856024850186610554565b60405191829182610164565b0390f35b80fd5b600435906001600160a01b038216820361011f57565b600080fd5b919082519283825260005b848110610150575050826000602080949584010152601f8019910116010190565b60208183018101518483018201520161012f565b906020610175928181520190610124565b90565b3461011f57604036600319011261011f57610191610109565b602435906001600160a01b0390818316830361011f571660009081526003602090815260408083206001600160a01b03909416835292815291902060ff9054166040519015158152f35b3461011f57602036600319011261011f5760043563ffffffff60e01b811680910361011f576000526002602052602060018060a01b0360406000205416604051908152f35b3461011f57600036600319011261011f576040517f00000000000000000000000000000000000000000000000000000000000000006001600160a01b03168152602090f35b3461011f57600036600319011261011f576000546040516001600160a01b039091168152602090f35b3461011f57600036600319011261011f576020600154604051908152f35b3461011f57602036600319011261011f576102c5610109565b6001600160a01b03907f000000000000000000000000000000000000000000000000000000000000000082163381036103175750166bffffffffffffffffffffffff60a01b6000541617600055600080f35b6044906040519063124ad49160e11b82526004820152336024820152fd5b634e487b7160e01b600052604160045260246000fd5b6040519190601f01601f1916820167ffffffffffffffff81118382101761037157604052565b610335565b67ffffffffffffffff811161037157601f01601f191660200190565b9190916103a66103a182610376565b61034b565b92818452811161011f57602081600092838387013784010152565b9291926103d06103a183610376565b938285528282011161011f57816000926020928387013784010152565b606090610175939260408252806040830152806000848401376000838284010152601f8019910116810190602083828403019101520190610124565b82610175949360609360408452816040850152848401376000838284010152601f8019910116810190602083828403019101520190610124565b600080356001600160e01b0319168082526002602052604090912091929161049290546001600160a01b031690565b6001600160a01b03811691821561052a57506104b76104b13686610392565b83610673565b927fc4dabe0d7ef7462e2218f2c398c21ef217803e1c46f5cf802d1a5d1d9b503f2f8480976104eb604051928392836103ed565b0390a2156104f7575050565b8151156105075750805190602001fd5b60405163023c045d60e21b81526001600160a01b03919091166004820152602490fd5b60405163300eff3960e21b81523360048201526001600160e01b0319919091166024820152604490fd5b6000549293926001600160a01b03929083163381141580610645575b6106155750813b156105f4577fb24ebe141c5f2a744b103bea65fce6c40e0dc65d7341d092c09b160f404479906105b16105ab3688856103c1565b84610673565b9490936105c8868099604051948594169684610429565b0390a2156105d35750565b8051156105e257602081519101fd5b60405163061a160d60e41b8152600490fd5b604051636d17e5ef60e11b81526001600160a01b0383166004820152602490fd5b6040516355d1750960e01b81526001600160a01b0391821660048201523360248201529216604483015250606490fd5b503360009081526003602090815260408083206001600160a01b038716845290915290205460ff1615610570565b6000805490936001600160a01b039182169390925a9060015482039182116107165791869291839260208351930191f4923d1561070c576106d63d6106ba6103a182610376565b9081523d87602083013e5b95549495946001600160a01b031690565b91821681036106e3575050565b60405163609ca23d60e01b81526001600160a01b03918216600482015291166024820152604490fd5b6106d660606106c5565b634e487b7160e01b87526011600452602487fd";
        assembly {
            registry := create(0, add(bytecode, 0x20), mload(bytecode))
        }
        if (address(registry) == address(0)) {
            revert PRBProxy_Precompiles_DeploymentError();
        }
    }

    /// @notice Deploys {PRBProxyAnnex} and {PRBProxyRegistry} from precompiled bytecode.
    function deploySystem() public returns (IPRBProxyAnnex annex, IPRBProxyRegistry registry) {
        annex = deployAnnex();
        registry = deployRegistry();
    }
}
