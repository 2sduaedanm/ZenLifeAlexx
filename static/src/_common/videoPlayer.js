import React from 'react'
import ReactPlayer from 'react-player';
import PropTypes from 'prop-types';

const VideoPlayer = ({url}) => {
  return (
    <div className="videoPlayer">
      <ReactPlayer
        url={url}
        controls={true}
        playing
        width={"100%"}
        height={"auto"}
      />
    </div>
  )
}


VideoPlayer.propTypes = {
  url: PropTypes.string.isRequired,
};

export default VideoPlayer