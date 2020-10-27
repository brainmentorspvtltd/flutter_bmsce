class Account {
  int id;
  String name;
  double balance;
  Account(double balance) {
    this.balance = balance;
  }
  /*Account() {
    balance = 10000;
    print("Account class default constructor");
  }*/
  void getBalance() {
    print("Balance is $balance");
  }

  void deposit() {
    print("Deposit in Account");
  }

  void roi() {
    print("2% ROI");
  }
}

class SavingAccount extends Account {
  SavingAccount() : super(1000) {
    //SavingAccount():super() {
    print("SavingAccount class default constructor");
  }

  @override
  void roi() {
    super.roi();
    print("4% ROI in SA");
  }

  void limit() {
    print("Limit of Transcation");
  }
}

class CurrentAccount extends Account {
  CurrentAccount() : super(1) {}
  @override
  void roi() {
    print("5% ROI in CA to PAY");
  }

  void odLimit() {
    print("OD LImit for Current Account");
  }
}

// Upcasting
// Polymorphic method
void caller(Account account) {
  print("**********************************");
  account.deposit();
  account.getBalance();
  account.roi();
  if (account is SavingAccount) {
    SavingAccount sa = account as SavingAccount;
    sa.limit();
  }
  if (account is CurrentAccount) {
    CurrentAccount ca = account as CurrentAccount; // Downcasting
    ca.odLimit();
  }
}

/*void caller({SavingAccount sa , CurrentAccount ca}){
  if(sa!=null){

  }
  else
  if(ca!=null){

  }
}*/

void main() {
  caller(SavingAccount());
  caller(CurrentAccount());
  /*
  Account account = SavingAccount(); // Upcasting
  //SavingAccount sa = SavingAccount();
  account.deposit();
  account.getBalance();
  account.limit();
  account.roi();
  print("**************************");
  CurrentAccount ca = CurrentAccount();
  ca.deposit();
  ca.getBalance();
  ca.odLimit();
  ca.roi();
  */
}
