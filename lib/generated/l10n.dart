// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your Email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPassword {
    return Intl.message(
      'Forget password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Continue as guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter first name`
  String get enterFirstName {
    return Intl.message(
      'Enter first name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter last name`
  String get enterLastName {
    return Intl.message(
      'Enter last name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message('First name', name: 'firstName', desc: '', args: []);
  }

  /// `Last name`
  String get lastName {
    return Intl.message('Last name', name: 'lastName', desc: '', args: []);
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Creating an account, you agree to our`
  String get agreeToTerms {
    return Intl.message(
      'Creating an account, you agree to our',
      name: 'agreeToTerms',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginLink {
    return Intl.message('Login', name: 'loginLink', desc: '', args: []);
  }

  /// `Sign up`
  String get signUpLink {
    return Intl.message('Sign up', name: 'signUpLink', desc: '', args: []);
  }

  /// `Email cannot be empty`
  String get emailRequired {
    return Intl.message(
      'Email cannot be empty',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get emailInvalid {
    return Intl.message(
      'Please enter a valid email',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get passwordRequired {
    return Intl.message(
      'Password cannot be empty',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter and one number`
  String get passwordInvalid {
    return Intl.message(
      'Password must contain at least one uppercase letter and one number',
      name: 'passwordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Email verification`
  String get emailVerification {
    return Intl.message(
      'Email verification',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code sent to your email address`
  String get enterCodeSentToEmail {
    return Intl.message(
      'Please enter the code sent to your email address',
      name: 'enterCodeSentToEmail',
      desc: '',
      args: [],
    );
  }

  /// `Resend in`
  String get resendIn {
    return Intl.message('Resend in', name: 'resendIn', desc: '', args: []);
  }

  /// `Didn't receive code?`
  String get didNotReceiveCode {
    return Intl.message(
      'Didn\'t receive code?',
      name: 'didNotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Please enter your email associated to your account`
  String get forgetPasswordDescription {
    return Intl.message(
      'Please enter your email associated to your account',
      name: 'forgetPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Guest User`
  String get guestUser {
    return Intl.message('Guest User', name: 'guestUser', desc: '', args: []);
  }

  /// `My orders`
  String get myOrders {
    return Intl.message('My orders', name: 'myOrders', desc: '', args: []);
  }

  /// `Saved address`
  String get savedAddress {
    return Intl.message(
      'Saved address',
      name: 'savedAddress',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `About us`
  String get aboutUs {
    return Intl.message('About us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Occasions`
  String get occasions {
    return Intl.message('Occasions', name: 'occasions', desc: '', args: []);
  }

  /// `Best Sellers`
  String get BestSellers {
    return Intl.message(
      'Best Sellers',
      name: 'BestSellers',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `View all`
  String get viewAll {
    return Intl.message('View all', name: 'viewAll', desc: '', args: []);
  }

  /// `confirm logout`
  String get confirmLogout {
    return Intl.message(
      'confirm logout',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? This action is permanent and cannot be undone.`
  String get confirmDeleteAccount {
    return Intl.message(
      'Are you sure you want to delete your account? This action is permanent and cannot be undone.',
      name: 'confirmDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `cancel`
  String get cancel {
    return Intl.message('cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Saved Addresses`
  String get saved_addresses {
    return Intl.message(
      'Saved Addresses',
      name: 'saved_addresses',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get add_new_addresses {
    return Intl.message(
      'Add New Address',
      name: 'add_new_addresses',
      desc: '',
      args: [],
    );
  }

  /// `No address found.`
  String get no_address_found {
    return Intl.message(
      'No address found.',
      name: 'no_address_found',
      desc: '',
      args: [],
    );
  }

  /// `Address Details`
  String get address_details {
    return Intl.message(
      'Address Details',
      name: 'address_details',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message('Street', name: 'street', desc: '', args: []);
  }

  /// `Bloom with our exquisite best sellers`
  String get bloomwithourexquisitebestsellers {
    return Intl.message(
      'Bloom with our exquisite best sellers',
      name: 'bloomwithourexquisitebestsellers',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Enter your address`
  String get enterAddress {
    return Intl.message(
      'Enter your address',
      name: 'enterAddress',
      desc: '',
      args: [],
    );
  }

  /// `Recipient name`
  String get recipientName {
    return Intl.message(
      'Recipient name',
      name: 'recipientName',
      desc: '',
      args: [],
    );
  }

  /// `Enter the recipient name`
  String get enterRecipientName {
    return Intl.message(
      'Enter the recipient name',
      name: 'enterRecipientName',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Cairo`
  String get cairo {
    return Intl.message('Cairo', name: 'cairo', desc: '', args: []);
  }

  /// `Area`
  String get area {
    return Intl.message('Area', name: 'area', desc: '', args: []);
  }

  /// `October`
  String get october {
    return Intl.message('October', name: 'october', desc: '', args: []);
  }

  /// `Save address`
  String get saveAddress {
    return Intl.message(
      'Save address',
      name: 'saveAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an address`
  String get addressRequired {
    return Intl.message(
      'Please enter an address',
      name: 'addressRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a phone number`
  String get phoneNumberRequired {
    return Intl.message(
      'Please enter a phone number',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a recipient name`
  String get recipientNameRequired {
    return Intl.message(
      'Please enter a recipient name',
      name: 'recipientNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a city`
  String get cityRequired {
    return Intl.message(
      'Please enter a city',
      name: 'cityRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an area`
  String get areaRequired {
    return Intl.message(
      'Please enter an area',
      name: 'areaRequired',
      desc: '',
      args: [],
    );
  }

  /// `Address saved successfully`
  String get addressSavedSuccessfully {
    return Intl.message(
      'Address saved successfully',
      name: 'addressSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Delivery time`
  String get deliveryTime {
    return Intl.message(
      'Delivery time',
      name: 'deliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message('Schedule', name: 'schedule', desc: '', args: []);
  }

  /// `Instant`
  String get instant {
    return Intl.message('Instant', name: 'instant', desc: '', args: []);
  }

  /// `Arrive by`
  String get arriveBy {
    return Intl.message('Arrive by', name: 'arriveBy', desc: '', args: []);
  }

  /// `Delivery Address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery Address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add new`
  String get addNew {
    return Intl.message('Add new', name: 'addNew', desc: '', args: []);
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash on delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Credit card`
  String get creditCard {
    return Intl.message('Credit card', name: 'creditCard', desc: '', args: []);
  }

  /// `It is a gift`
  String get itIsAGift {
    return Intl.message('It is a gift', name: 'itIsAGift', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Sub Total`
  String get subTotal {
    return Intl.message('Sub Total', name: 'subTotal', desc: '', args: []);
  }

  /// `Delivery Fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Place order`
  String get placeOrder {
    return Intl.message('Place order', name: 'placeOrder', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Old`
  String get old {
    return Intl.message('Old', name: 'old', desc: '', args: []);
  }

  /// `New`
  String get newDate {
    return Intl.message('New', name: 'newDate', desc: '', args: []);
  }

  /// `Highest Prise`
  String get highest_Price {
    return Intl.message(
      'Highest Prise',
      name: 'highest_Price',
      desc: '',
      args: [],
    );
  }

  /// `Sort By`
  String get sort_py {
    return Intl.message('Sort By', name: 'sort_py', desc: '', args: []);
  }

  /// `Lower Price`
  String get lowes_Price {
    return Intl.message('Lower Price', name: 'lowes_Price', desc: '', args: []);
  }

  /// `My Orders`
  String get myOrder {
    return Intl.message('My Orders', name: 'myOrder', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Not Found Active Orders`
  String get notfoundActiveOrders {
    return Intl.message(
      'Not Found Active Orders',
      name: 'notfoundActiveOrders',
      desc: '',
      args: [],
    );
  }

  /// `Not Found Completed Orders`
  String get notfoundCompletedOrders {
    return Intl.message(
      'Not Found Completed Orders',
      name: 'notfoundCompletedOrders',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get EGP {
    return Intl.message('EGP', name: 'EGP', desc: '', args: []);
  }

  /// `Delivered on`
  String get Deliveredon {
    return Intl.message(
      'Delivered on',
      name: 'Deliveredon',
      desc: '',
      args: [],
    );
  }

  /// `Reorder`
  String get Reorder {
    return Intl.message('Reorder', name: 'Reorder', desc: '', args: []);
  }

  /// `Order Number`
  String get OrderNumber {
    return Intl.message(
      'Order Number',
      name: 'OrderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get TrackOrder {
    return Intl.message('Track Order', name: 'TrackOrder', desc: '', args: []);
  }

  /// `Estimated arrival`
  String get estimatedArrival {
    return Intl.message(
      'Estimated arrival',
      name: 'estimatedArrival',
      desc: '',
      args: [],
    );
  }

  /// `Is your delivery here for today`
  String get isYourDeliveryHereForToday {
    return Intl.message(
      'Is your delivery here for today',
      name: 'isYourDeliveryHereForToday',
      desc: '',
      args: [],
    );
  }

  /// `Show map`
  String get showMap {
    return Intl.message('Show map', name: 'showMap', desc: '', args: []);
  }

  /// `account type`
  String get accountType {
    return Intl.message(
      'account type',
      name: 'accountType',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Worker`
  String get worker {
    return Intl.message('Worker', name: 'worker', desc: '', args: []);
  }

  /// `Merchant`
  String get merchant {
    return Intl.message('Merchant', name: 'merchant', desc: '', args: []);
  }

  /// `Distributor`
  String get distributor {
    return Intl.message('Distributor', name: 'distributor', desc: '', args: []);
  }

  /// `Select account type`
  String get selectAccountType {
    return Intl.message(
      'Select account type',
      name: 'selectAccountType',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Previous`
  String get previous {
    return Intl.message('Previous', name: 'previous', desc: '', args: []);
  }

  /// `Governorate`
  String get governorate {
    return Intl.message('Governorate', name: 'governorate', desc: '', args: []);
  }

  /// `Village`
  String get village {
    return Intl.message('Village', name: 'village', desc: '', args: []);
  }

  /// `Login Successfully`
  String get loginSuccessfully {
    return Intl.message(
      'Login Successfully',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }

  /// `Update profile info`
  String get updateProfile {
    return Intl.message(
      'Update profile info',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get myAccount {
    return Intl.message('My Account', name: 'myAccount', desc: '', args: []);
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Prizes`
  String get prize {
    return Intl.message('Prizes', name: 'prize', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Save Change`
  String get saveChanges {
    return Intl.message('Save Change', name: 'saveChanges', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Data has been updated successfully`
  String get datHasBeenUpdatedSuccessfully {
    return Intl.message(
      'Data has been updated successfully',
      name: 'datHasBeenUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get find {
    return Intl.message('Find', name: 'find', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message('Contact', name: 'contact', desc: '', args: []);
  }

  /// `Do you want to contact`
  String get doYouWantToContact {
    return Intl.message(
      'Do you want to contact',
      name: 'doYouWantToContact',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message('Wallet', name: 'wallet', desc: '', args: []);
  }

  /// `Available Balance`
  String get availableBalance {
    return Intl.message(
      'Available Balance',
      name: 'availableBalance',
      desc: '',
      args: [],
    );
  }

  /// `Add Money`
  String get addMoney {
    return Intl.message('Add Money', name: 'addMoney', desc: '', args: []);
  }

  /// `Transaction History`
  String get transactionHistory {
    return Intl.message(
      'Transaction History',
      name: 'transactionHistory',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `No Transactions Found`
  String get noTransactionsFound {
    return Intl.message(
      'No Transactions Found',
      name: 'noTransactionsFound',
      desc: '',
      args: [],
    );
  }

  /// `Add Money Successfully`
  String get addMoneySuccessfully {
    return Intl.message(
      'Add Money Successfully',
      name: 'addMoneySuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History Successfully`
  String get transactionHistorySuccessfully {
    return Intl.message(
      'Transaction History Successfully',
      name: 'transactionHistorySuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Add Money Failed`
  String get addMoneyFailed {
    return Intl.message(
      'Add Money Failed',
      name: 'addMoneyFailed',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History Failed`
  String get transactionHistoryFailed {
    return Intl.message(
      'Transaction History Failed',
      name: 'transactionHistoryFailed',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Enter Verification Code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter Verification Code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification code sent to your email`
  String get verificationCodeSentToYourEmail {
    return Intl.message(
      'Verification code sent to your email',
      name: 'verificationCodeSentToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Verify Successfully`
  String get verifySuccessfully {
    return Intl.message(
      'Verify Successfully',
      name: 'verifySuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Verify Failed`
  String get verifyFailed {
    return Intl.message(
      'Verify Failed',
      name: 'verifyFailed',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code sent to your email`
  String get enterTheDigitCodeSentToYourEmail {
    return Intl.message(
      'Enter the 6-digit code sent to your email',
      name: 'enterTheDigitCodeSentToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Successfully`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password Reset Successfully',
      name: 'passwordResetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `No Founded Users`
  String get noFoundedUsers {
    return Intl.message(
      'No Founded Users',
      name: 'noFoundedUsers',
      desc: '',
      args: [],
    );
  }

  /// `No Transactions Yet`
  String get noTransactionsYet {
    return Intl.message(
      'No Transactions Yet',
      name: 'noTransactionsYet',
      desc: '',
      args: [],
    );
  }

  /// `Start earning points to see them here`
  String get startEarningPointsToSeeThemHere {
    return Intl.message(
      'Start earning points to see them here',
      name: 'startEarningPointsToSeeThemHere',
      desc: '',
      args: [],
    );
  }

  /// `Redeem`
  String get redeem {
    return Intl.message('Redeem', name: 'redeem', desc: '', args: []);
  }

  /// `Points`
  String get points {
    return Intl.message('Points', name: 'points', desc: '', args: []);
  }

  /// `Total Points`
  String get totalPoints {
    return Intl.message(
      'Total Points',
      name: 'totalPoints',
      desc: '',
      args: [],
    );
  }

  /// `No prizes found now`
  String get noPrizesFoundNow {
    return Intl.message(
      'No prizes found now',
      name: 'noPrizesFoundNow',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `My Points`
  String get myPoints {
    return Intl.message('My Points', name: 'myPoints', desc: '', args: []);
  }

  /// `Wallet Balance`
  String get walletBalance {
    return Intl.message(
      'Wallet Balance',
      name: 'walletBalance',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message('ID', name: 'id', desc: '', args: []);
  }

  /// `Hey there`
  String get heyThere {
    return Intl.message('Hey there', name: 'heyThere', desc: '', args: []);
  }

  /// `Scan`
  String get scan {
    return Intl.message('Scan', name: 'scan', desc: '', args: []);
  }

  /// `Redeem Code`
  String get redeemCode {
    return Intl.message('Redeem Code', name: 'redeemCode', desc: '', args: []);
  }

  /// `Enter Redeem Code`
  String get enterRedeemCode {
    return Intl.message(
      'Enter Redeem Code',
      name: 'enterRedeemCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code`
  String get enterCode {
    return Intl.message('Enter Code', name: 'enterCode', desc: '', args: []);
  }

  /// `Powered by`
  String get poweredBy {
    return Intl.message('Powered by', name: 'poweredBy', desc: '', args: []);
  }

  /// `No enough points`
  String get noEnoughPoints {
    return Intl.message(
      'No enough points',
      name: 'noEnoughPoints',
      desc: '',
      args: [],
    );
  }

  /// `No Categories Found`
  String get noCategoriesFound {
    return Intl.message(
      'No Categories Found',
      name: 'noCategoriesFound',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Product`
  String get product {
    return Intl.message('Product', name: 'product', desc: '', args: []);
  }

  /// `No Products Found`
  String get noProductsFound {
    return Intl.message(
      'No Products Found',
      name: 'noProductsFound',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
  }

  /// `Order`
  String get order {
    return Intl.message('Order', name: 'order', desc: '', args: []);
  }

  /// `Could not open WhatsApp. Please make sure it is installed and try again.`
  String get couldNotOpenWhatsApp {
    return Intl.message(
      'Could not open WhatsApp. Please make sure it is installed and try again.',
      name: 'couldNotOpenWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Remaining Points`
  String get remainingPoints {
    return Intl.message(
      'Remaining Points',
      name: 'remainingPoints',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
