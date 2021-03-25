import React from 'react';
import { ButtonDropdown, DropdownToggle, DropdownMenu, DropdownItem } from 'reactstrap';
import { getProfileData } from '../../ducks/profile';
import { connect } from 'react-redux';
import {withRouter}from 'react-router-dom'

// import user from './../../resources/images/user.svg'
const mapStateToProps = state => ({
  profileData: state.profile.profileData,
});

class ProfileMenu extends React.Component {
  constructor(props) {
    super(props);

    this.toggle = this.toggle.bind(this);
    this.state = {
      dropdownOpen: false,
    };
  };

  componentDidMount(){
    const {dispatch} = this.props;
    dispatch(getProfileData());
  };

  toggle() {
    this.setState({
      dropdownOpen: !this.state.dropdownOpen,
    });
  };

  handleLogout=()=>{
    const {history} = this.props;
    localStorage.removeItem('token');
    history.push('/');
  };

  render() {

    const {profileData} = this.props;
    // console.log('-> ', profileData);

    return (
      <div className="profile-dropdown-cover">
        <ButtonDropdown direction={'left'} isOpen={this.state.dropdownOpen} toggle={this.toggle}>
          <DropdownToggle caret>
            <img src={process.env.REACT_APP_MEDIA_SERVER + profileData.img} alt=""/>
          </DropdownToggle>
          <DropdownMenu>
            <DropdownItem disabled>Name:  {profileData.full_name}</DropdownItem>
            <DropdownItem disabled>Position: {profileData.user && profileData.user.instructor && "Instructor"}{profileData.user && profileData.user.student && "Strudent"}</DropdownItem>
            <DropdownItem divider />
            <DropdownItem onClick={this.handleLogout}>Logout</DropdownItem>
          </DropdownMenu>
        </ButtonDropdown>
      </div>

    );
  }
}

export default withRouter(connect(mapStateToProps)(ProfileMenu))