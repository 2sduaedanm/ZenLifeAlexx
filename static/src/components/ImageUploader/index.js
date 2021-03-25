import React from 'react';
import './styles.scss';

const ImageUploader = (props) => {
    let inputRef;
    function getRef(input){
        if(input){
            inputRef = input;
        }
    }
    function onClick(e){
        inputRef.click();
    }
    return (
        <div className="inputfile-wrapper">
            <input onClick={e => e.stopPropagation()} onChange={props.onChange} ref={getRef} type="file" name="file" id="file" accept="image/*" className="inputfile"/>
            <label htmlFor="file" onClick={onClick}>update photo</label>
        </div>
    )
};


export default ImageUploader;