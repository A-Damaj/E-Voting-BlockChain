async function connectToMetamask() {
    if (window.ethereum) {
        try {
            const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
            const selectedAccount = accounts[0];
           // console.log('Logged in with Ethereum account:', selectedAccount);
           alert("Logged In Successfully with Eth account: "+selectedAccount)
            window.location.href = "vote.html"
        }
        catch (error){
            console.log('User Denied Account Access');
        }
    } else {
        console.error('MetaMask not detected. Please install MetaMask.');
    }
}