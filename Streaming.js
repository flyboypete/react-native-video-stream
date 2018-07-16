/**
 * Created by buhe on 16/4/29.
 */
import React, {Component} from 'react';
import {requireNativeComponent, Dimensions, NativeModules, View} from 'react-native';
import { PropTypes } from 'prop-types';
//
// class Stream extends Component {
// 	static propTypes = {
//
// 	};
//
// 	render() {
// 		return (
// 			<RCTStream
// 				{...this.props}
// 			/>
// 		)
// 	}
// }
const { width , height } = Dimensions.get('window');

class Stream extends Component {
	constructor(props, context){
		super(props, context);
		this._onReady = this._onReady.bind(this);
		this._onPending = this._onPending.bind(this);
		this._onStart = this._onStart.bind(this);
		this._onFail = this._onFail.bind(this);
		this._onStop = this._onStop.bind(this);
		this._onBitRateChange = this._onBitRateChange.bind(this);
	}

	componentWillMount(){

	}

	setPointOfInterest(x, y){
		NativeModules.StreamManager.focusOnPoint(x,y);
	}

	async captureImage() {
		return await NativeModules.StreamManager.captureImage();
	}

	componentWillUnmount(){
		this.setNativeProps({started: false});
		//this._root.stop();
	}

	_assignRoot = (component) => {
	  this._root = component;
	};

	setNativeProps(nativeProps) {
	  this._root.setNativeProps(nativeProps);
	}


	static propTypes = {
		started: PropTypes.bool,
		cameraFronted: PropTypes.bool,
		url: PropTypes.string.isRequired,
		landscape: PropTypes.bool.isRequired,
		stop: PropTypes.func,
		zoom: PropTypes.number,
		brightness: PropTypes.number,


		onReady: PropTypes.func,
		onPending: PropTypes.func,
		onStart: PropTypes.func,
		onFail: PropTypes.func,
		onStop: PropTypes.func,
		onBitRateChange: PropTypes.func,
		...View.propTypes,
	}

	static defaultProps= {
		cameraFronted: true,
		stopped: false
	}

	_onReady(event){
		this.props.onReady && this.props.onReady(event.nativeEvent);
	}

	_onPending(event) {
		this.props.onPending && this.props.onPending(event.nativeEvent);
	}

	_onStart(event) {
		this.props.onStart && this.props.onStart(event.nativeEvent);
	}

	_onFail(event) {
		this.props.onFail && this.props.onFail(event.nativeEvent);
	}

	_onStop(event) {
		this.props.onStop && this.props.onStop(event.nativeEvent);
	}

	_onBitRateChange(event) {
		if (!this.props.onBitRateChange) {
			return;
		}
		console.log('running onbitratechange');
		this.props.onBitRateChange(event.nativeEvent);
	}

	render() {
		let style = this.props.style;
		if(this.props.style){
			if(this.props.landscape){
				style = {
					...this.props.style,
					transform:[{rotate:'270deg'}],
					width:height,
					height:width
				};
			}else{
				style = {
					width: width,
					height: height,
					...this.props.style
				}
			}
		}
		const nativeProps = {
			...this.props,
			onReady: this._onReady,
			onPending: this._onPending,
			onStart: this._onStart,
			onFail: this._onFail,
			onStop: this._onStop,
			onBitRateChange: this._onBitRateChange,
			style: {
				...style
			}
		};

		return (
			<RCTStream
				ref={this._assignRoot}
				{...nativeProps}
			/>
		)
	}
}

const RCTStream = requireNativeComponent('RCTStream', Stream);

module.exports = Stream;
